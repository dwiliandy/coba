# == Schema Information
#
# Table name: nama_keluargas
#
#  id                           :bigint           not null, primary key
#  active                       :boolean          default(TRUE)
#  kolom                        :string
#  nama                         :string
#  nomor_kartu_keluarga         :string
#  tanggal_pernikahan           :date
#  ulang_tahun_pernikahan_aktif :boolean          default(TRUE)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
class NamaKeluarga < ApplicationRecord
  has_many :anggota_keluargas
  # after_update :cek_ulang_tahun_pernikahan
  #Validasi
  validates :nama, :presence => true,
    :on => [:update, :create]
  validates :kolom, :presence => true,
    :on => [:update, :create]
  accepts_nested_attributes_for :anggota_keluargas, :reject_if => :all_blank, allow_destroy: true

  scope :ulang_tahun, ->(mulai_bulan, selesai_bulan, mulai_tanggal, selesai_tanggal){where("EXTRACT(month FROM tanggal_pernikahan) >= ? AND EXTRACT(month FROM tanggal_pernikahan) <= ? AND EXTRACT(day FROM tanggal_pernikahan) >= ? AND EXTRACT(day FROM tanggal_pernikahan) <= ?  and ulang_tahun_pernikahan_aktif = ? and active = ?",mulai_bulan,selesai_bulan,mulai_tanggal,selesai_tanggal,true,true )}


  def daftar_ulang_tahun_pernikahan
    if self.anggota_keluargas.where(meninggal: false).pluck(:status_hubungan).exclude? ('kepala_keluarga') or self.anggota_keluargas.pluck(:status_hubungan).exclude? ('istri')
      self.update(ulang_tahun_pernikahan_aktif: false)
    else
      self.update(ulang_tahun_pernikahan_aktif: true)
    end
  end

  def umur_pernikahan
    now = Date.today
    now.year - tanggal_pernikahan.year - ((now.month > tanggal_pernikahan.month || (now.month == tanggal_pernikahan.month && now.day >= tanggal_pernikahan.day)) ? 0 : 1)
  end
end
