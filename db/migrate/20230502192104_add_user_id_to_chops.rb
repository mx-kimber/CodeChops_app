class AddUserIdToChops < ActiveRecord::Migration[7.0]
  def change
    add_column :chops, :user_id, :integer
  end
end
