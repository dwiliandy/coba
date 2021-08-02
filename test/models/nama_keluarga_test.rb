# == Schema Information
#
# Table name: nama_keluargas
#
#  id                   :bigint           not null, primary key
#  kolom                :string
#  nama                 :string
#  nomor_kartu_keluarga :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
require "test_helper"

class NamaKeluargaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
