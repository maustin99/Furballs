class CreateKitties < ActiveRecord::Migration[5.1]
  def change
    create_table :kitties do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.boolean :neutered
      t.string :image

      t.timestamps
    end
  end
end
