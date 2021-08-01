# == Schema Information
#
# Table name: koloms
#
#  id         :bigint           not null, primary key
#  nama       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Kolom < ApplicationRecord
  has_many :nama_keluargas, dependent: :delete_all
end
