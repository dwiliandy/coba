# == Schema Information
#
# Table name: koloms
#
#  id         :bigint           not null, primary key
#  nama       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Kolom < ApplicationRecord

  def jumlah_nama_keluarga
    NamaKeluarga.where("active = ? and kolom = ?",true, self.nama).count
  end

  def jumlah_anggota_keluarga
    jumlah = 0
    NamaKeluarga.where("active = ? and kolom = ?",true, self.nama).each do |jumlah_anggota|
        jumlah = jumlah + jumlah_anggota.anggota_keluargas.where(meninggal: false).count
    end
    jumlah
  end
end
