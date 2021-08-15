class AddUlangTahunPernikahanAktifToNamaKeluargas < ActiveRecord::Migration[6.1]
  def change
    add_column :nama_keluargas, :ulang_tahun_pernikahan_aktif, :boolean, default: true
  end
end
