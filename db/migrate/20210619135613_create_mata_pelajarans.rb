class CreateMataPelajarans < ActiveRecord::Migration[6.1]
  def change
    create_table :mata_pelajarans do |t|
      t.string :nama

      t.timestamps
    end
  end
end
