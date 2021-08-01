class CreateKoloms < ActiveRecord::Migration[6.1]
  def change
    create_table :koloms do |t|
      t.string :nama
      
      t.timestamps
    end
  end
end
