# == Schema Information
#
# Table name: nama_keluargas
#
#  id         :bigint           not null, primary key
#  NomorKK    :string
#  nama       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class NamaKeluarga < ApplicationRecord
end
