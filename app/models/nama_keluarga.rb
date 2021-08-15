# == Schema Information
#
# Table name: nama_keluargas
#
#  id                        :bigint           not null, primary key
#  UlangTahunPernikahanAktif :boolean          default(TRUE)
#  active                    :boolean          default(TRUE)
#  kolom                     :string
#  nama                      :string
#  nomor_kartu_keluarga      :string
#  tanggal_pernikahan        :date
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
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

  # def cek_ulang_tahun_pernikahan
  #   if self.anggota_keluargas.pluck(:status_hubungan).exclude? ('kepala_keluarga') and self.anggota_keluargas.pluck(:status_hubungan).exclude? ('istri')
  #     self.update(UlangTahunPernikahanAktif: false)
  #   end
  # end
end
