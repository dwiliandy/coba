class RemoveKolomFromNamaKeluargas < ActiveRecord::Migration[6.1]
  def change
    remove_reference :nama_keluargas, :kolom, index:true, foreign_key: true
  end
end
