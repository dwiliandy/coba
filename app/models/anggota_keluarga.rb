# == Schema Information
#
# Table name: anggota_keluargas
#
#  id               :bigint           not null, primary key
#  jenis_kelamin    :integer
#  nama             :string
#  nik              :string
#  tanggal_lahir    :date
#  tempat_lahir     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  nama_keluarga_id :bigint           not null
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

  enum jenis_kelamin: {pria: 1, wanita: 2}
end