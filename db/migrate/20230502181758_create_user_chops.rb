class CreateUserChops < ActiveRecord::Migration[7.0]
  def change
    create_table :user_chops do |t|
      t.integer :user_id
      t.integer :chop_id
      t.string :rating

      t.timestamps
    end
  end
end
