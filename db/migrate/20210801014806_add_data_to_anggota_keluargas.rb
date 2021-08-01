class AddDataToAnggotaKeluargas < ActiveRecord::Migration[6.1]
  def change
    add_column :anggota_keluargas, :status_perkawinan, :integer
    add_column :anggota_keluargas, :status_hubungan, :integer
  end
end
