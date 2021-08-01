# == Schema Information
#
# Table name: nama_keluargas
#
#  id                   :bigint           not null, primary key
#  nama                 :string
#  nomor_kartu_keluarga :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  kolom_id             :bigint           not null
#
# Indexes
#
#  index_nama_keluargas_on_kolom_id  (kolom_id)
#
# Foreign Keys
#
#  fk_rails_...  (kolom_id => koloms.id)
#
require "test_helper"

class NamaKeluargaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
