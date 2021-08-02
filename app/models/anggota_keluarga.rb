# == Schema Information
#
# Table name: anggota_keluargas
#
#  id                :bigint           not null, primary key
#  baptis            :integer
#  jenis_kelamin     :integer
#  nama              :string
#  nik               :string
#  sidi              :integer
#  status_hubungan   :integer
#  status_perkawinan :integer
#  tanggal_lahir     :date
#  tempat_lahir      :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  nama_keluarga_id  :bigint           not null
#
# Indexes
#
#  index_anggota_keluargas_on_nama_keluarga_id  (nama_keluarga_id)
#
# Foreign Keys
#
#  fk_rails_...  (nama_keluarga_id => nama_keluargas.id)
#
class AnggotaKeluarga < ApplicationRecord
  belongs_to :nama_keluarga
  enum jenis_kelamin: {pria: 1, wanita: 2}
  enum status_hubungan: {kepala_keluarga: 1, istri: 2, anak: 3, orang_tua: 4}
  enum status_perkawinan: {kawin: 1, belum_kawin: 2, cerai_hidup: 3, cerai_mati: 4}
  
  
  #Scope Kategorial
  scope :pkb, ->{where('jenis_kelamin = ? and status_perkawinan != ?',1,2)}
  scope :wki, ->{where('jenis_kelamin = ? and status_perkawinan != ?',2,2)}
  scope :pemuda, ->{where("status_perkawinan = ? and date_part('year', age(tanggal_lahir)) >= ? AND date_part('year', age(tanggal_lahir)) <= ?",2,17,35)}
  
  scope :ulang_tahun, ->(mulai_bulan, selesai_bulan, mulai_tanggal, selesai_tanggal){where("EXTRACT(month FROM tanggal_lahir) >= ? AND EXTRACT(month FROM tanggal_lahir) <= ? AND EXTRACT(day FROM tanggal_lahir) >= ? AND EXTRACT(day FROM tanggal_lahir) <= ?",mulai_bulan,selesai_bulan,mulai_tanggal,selesai_tanggal )}

  BAPTIS_SIDI_OPTIONS = [
    ["Sudah", 1],
    ["Belum", 2],
  ]

  def baptis_sidi_list
    BAPTIS_SIDI_OPTIONS.map do |x,y|
      {
       :id => y,
       :name => x
      }
    end
  end

  def umur
    now = Date.today
    now.year - tanggal_lahir.year - ((now.month > tanggal_lahir.month || (now.month == tanggal_lahir.month && now.day >= tanggal_lahir.day)) ? 0 : 1)
  end
end
