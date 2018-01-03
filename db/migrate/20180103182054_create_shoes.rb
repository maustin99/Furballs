class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoes do |t|
      t.string :brand
      t.float :size
      t.string :color

      t.timestamps
    end
  end
end
