class AddKolomToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :nama_keluargas, :kolom, :string
  end
end
