# == Schema Information
#
# Table name: nama_keluargas
#
#  id                   :bigint           not null, primary key
#  active               :boolean          default(TRUE)
#  kolom                :string
#  nama                 :string
#  nomor_kartu_keluarga :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class NamaKeluarga < ApplicationRecord
  has_many :anggota_keluargas
  accepts_nested_attributes_for :anggota_keluargas, :reject_if => :all_blank, allow_destroy: true


end
