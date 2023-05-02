class CreateChops < ActiveRecord::Migration[7.0]
  def change
    create_table :chops do |t|
      t.text :problem
      t.string :solution
      t.integer :category_id

      t.timestamps
    end
  end
end
