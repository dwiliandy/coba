# == Schema Information
#
# Table name: keuangans
#
#  id         :bigint           not null, primary key
#  keterangan :text
#  nominal    :integer
#  tipe       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class KeuanganTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
