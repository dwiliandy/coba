class AddActiveToNamaKeluargas < ActiveRecord::Migration[6.1]
  def change
    add_column :nama_keluargas, :active, :boolean, default: true
    
  end
end
