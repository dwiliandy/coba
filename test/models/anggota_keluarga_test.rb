# == Schema Information
#
# Table name: anggota_keluargas
#
#  id                :bigint           not null, primary key
#  baptis            :integer
#  jenis_kelamin     :integer
#  meninggal         :boolean          default(FALSE)
#  nama              :string
#  nik               :string
#  sidi              :integer
#  status_hubungan   :integer
#  status_perkawinan :integer
#  tanggal_lahir     :date
#  tanggal_meninggal :date
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
require "test_helper"

class AnggotaKeluargaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
