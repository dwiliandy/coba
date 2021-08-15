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
require "test_helper"

class NamaKeluargaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
