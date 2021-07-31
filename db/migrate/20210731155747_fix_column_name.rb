class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :nama_keluargas, :NomorKK, :nomor_kk
  end
end
