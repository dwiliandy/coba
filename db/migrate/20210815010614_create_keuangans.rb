class CreateKeuangans < ActiveRecord::Migration[6.1]
  def change
    create_table :keuangans do |t|
      t.integer :nominal
      t.integer :tipe
      t.text :keterangan

      t.timestamps
    end
  end
end
