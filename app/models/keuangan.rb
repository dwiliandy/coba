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
class Keuangan < ApplicationRecord
  enum tipe: {pemasukkan: 0, pengeluaran: 1}

end
