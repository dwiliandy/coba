class AddKolomToNamaKeluargas < ActiveRecord::Migration[6.1]
  def change
    add_reference :nama_keluargas, :kolom, null: false, foreign_key: true
  end
end
