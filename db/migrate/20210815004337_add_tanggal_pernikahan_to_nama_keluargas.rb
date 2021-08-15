class AddTanggalPernikahanToNamaKeluargas < ActiveRecord::Migration[6.1]
  def change
    add_column :nama_keluargas, :tanggal_pernikahan, :date
  end
end
