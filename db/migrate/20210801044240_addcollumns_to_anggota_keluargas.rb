class AddcollumnsToAnggotaKeluargas < ActiveRecord::Migration[6.1]
  def change
    add_column :anggota_keluargas, :sidi, :integer
    add_column :anggota_keluargas, :baptis, :integer
  end
end
