class CreateNamaKeluargas < ActiveRecord::Migration[6.1]
  def change
    create_table :nama_keluargas do |t|
      t.string :nama
      t.string :nomor_kartu_keluarga

      t.timestamps
    end
  end
end
