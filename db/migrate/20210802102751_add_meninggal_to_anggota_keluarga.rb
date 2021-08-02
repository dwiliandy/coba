class AddMeninggalToAnggotaKeluarga < ActiveRecord::Migration[6.1]
  def change
    add_column :anggota_keluargas, :tanggal_meninggal, :date
    add_column :anggota_keluargas, :meninggal, :boolean, default: false 
  end
end
