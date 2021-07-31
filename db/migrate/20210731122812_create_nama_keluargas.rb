class CreateNamaKeluargas < ActiveRecord::Migration[6.1]
  def change
    create_table :nama_keluargas do |t|
      t.string :nama
      t.string :nomor_kk

      t.timestamps
    end
  end
end
