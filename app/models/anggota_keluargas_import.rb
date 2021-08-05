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
      nama_keluarga = NamaKeluarga.find_by(nomor_kartu_keluarga: row['Nomor Kartu Keluarga']) || NamaKeluarga.new
      nama_keluarga.nama = row['Nama Keluarga']
      nama_keluarga.nomor_kartu_keluarga = row['Nomor Kartu Keluarga']
      nama_keluarga.kolom = row['Kolom']
      nama_keluarga.save
      anggota = nama_keluarga.anggota_keluargas.find_by(nik: row['Nik']) || nama_keluarga.anggota_keluargas.build
      anggota.nama = row['Nama Anggota']
      anggota.nik = row['Nik']
      if row['Jenis Kelamin'].eql? "Pria"
        anggota.jenis_kelamin = 1
      else
        anggota.jenis_kelamin = 2
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
      end
      if row['Status Perkawinan'].eql? 'Kawin'
        anggota.status_perkawinan = 1
      elsif row['Status Perkawinan'].eql? 'Belum Kawin'
        anggota.status_perkawinan = 2
      elsif row['Status Perkawinan'].eql? 'Cerai Hidup'
        anggota.status_perkawinan = 3
      elsif row['Status Perkawinan'].eql? 'Cerai Mati'
        anggota.status_perkawinan = 4
      end
      if row['Baptis'].eql? 'Sudah'
        anggota.baptis = 1
      else row['Baptis'].eql? 'Orang Tua'
        anggota.baptis = 2
      end
      if row['Sidi'].eql? 'Sudah'
        anggota.sidi = 1
      else row['Sidi'].eql? 'Orang Tua'
        anggota.sidi = 2
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