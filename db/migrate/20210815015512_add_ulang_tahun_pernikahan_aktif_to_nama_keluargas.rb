class AddUlangTahunPernikahanAktifToNamaKeluargas < ActiveRecord::Migration[6.1]
  def change
    add_column :nama_keluargas, :UlangTahunPernikahanAktif, :boolean, default: true
  end
end
