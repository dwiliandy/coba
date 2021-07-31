class CreateAnggotaKeluargas < ActiveRecord::Migration[6.1]
  def change
    create_table :anggota_keluargas do |t|
      t.string :nama
      t.string :nik
      t.integer :jenis_kelamin
      t.string :tempat_lahir
      t.date :tanggal_lahir

      t.timestamps
    end
  end
end
