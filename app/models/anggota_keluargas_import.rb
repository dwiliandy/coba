class AnggotaKeluargasImport
  include ActiveModel::Model
  require 'roo'

  attr_accessor :file

  def initialize(attributes={})
    attributes.each { |name, value| send("#{name}=", value) }
  end


  
  
  def persisted?
    false
  end
  
  def open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
  def load_imported_items
    spreadsheet = self.open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      anggota = AnggotaKeluarga.find_by(nik: row['Nik'].to_s) || AnggotaKeluarga.new
      if anggota.nama_keluarga.present?
        if row["Nomor Kartu Keluarga"].to_s.eql? anggota.nama_keluarga.nomor_kartu_keluarga
          anggota.nama_keluarga.nama = row['Nama Keluarga']
          anggota.nama_keluarga.nomor_kartu_keluarga = row['Nomor Kartu Keluarga'].to_s
          anggota.nama_keluarga.kolom = row['Nama Kolom']
        else
          anggota.nama_keluarga = NamaKeluarga.new
          anggota.nama_keluarga.nama = row['Nama Keluarga']
          anggota.nama_keluarga.nomor_kartu_keluarga = row['Nomor Kartu Keluarga'].to_s
          anggota.nama_keluarga.kolom = row['Kolom']
          anggota.nama_keluarga.save
        end
      else
        anggota.nama_keluarga = NamaKeluarga.find_by(nomor_kartu_keluarga: row['Nomor Kartu Keluarga'].to_s) || NamaKeluarga.new
        anggota.nama_keluarga.nama = row['Nama Keluarga']
        anggota.nama_keluarga.nomor_kartu_keluarga = row['Nomor Kartu Keluarga'].to_s
        anggota.nama_keluarga.kolom = row['Kolom']
        anggota.nama_keluarga.save
      end
        anggota.nama = row['Nama Anggota']
        anggota.nik = row['Nik'].to_s
      if row['Jenis Kelamin'].eql? "Pria"
        anggota.jenis_kelamin = 1
      elsif row['Jenis Kelamin'].eql? "Wanita"
        anggota.jenis_kelamin = 2
      else
        anggota.jenis_kelamin = nil
      end
      anggota.tempat_lahir = row['Tempat Lahir']
      anggota.tanggal_lahir = row['Tanggal Lahir']
      if row['Status Hubungan'].eql? 'Kepala Keluarga'
        anggota.status_hubungan = 1
      elsif row['Status Hubungan'].eql? 'Istri'
        anggota.status_hubungan = 2
      elsif row['Status Hubungan'].eql?'Anak'
        anggota.status_hubungan = 3
      elsif row['Status Hubungan'].eql?'Orang Tua'
        anggota.status_hubungan = 4
      else
        anggota.status_hubungan = nil
      end
      if row['Status Perkawinan'].eql? 'Kawin'
        anggota.status_perkawinan = 1
      elsif row['Status Perkawinan'].eql? 'Belum Kawin'
        anggota.status_perkawinan = 2
      elsif row['Status Perkawinan'].eql? 'Cerai Hidup'
        anggota.status_perkawinan = 3
      elsif row['Status Perkawinan'].eql? 'Cerai Mati'
        anggota.status_perkawinan = 4
      else
        anggota.status_perkawinan = nil
      end
      if row['Baptis'].eql? 'Sudah'
        anggota.baptis = 1
      elsif row['Baptis'].eql? 'Belum'
        anggota.baptis = 2
      else
        anggota.baptis = nil
      end
      if row['Sidi'].eql? 'Sudah'
        anggota.sidi = 1
      elsif row['Sidi'].eql? 'Belum'
        anggota.sidi = 2
      else
        anggota.sidi = nil
      end
      anggota
    end
  end
  

  def imported_items
    @imported_items ||= load_imported_items
  end

  def save
    if imported_items.map(&:valid?).all?
      imported_items.each(&:save!)
      a = imported_items.pluck(:nama_keluarga_id).uniq
        NamaKeluarga.where(id: a).each do |namas|
        namas.daftar_ulang_tahun_pernikahan
      end
      true
    else
      imported_items.each_with_index do |item, index|
        item.errors.full_messages.each do |msg|
          errors.add :base, "Row #{index + 2}: #{msg}"
        end
      end
      false
    end
  end
end