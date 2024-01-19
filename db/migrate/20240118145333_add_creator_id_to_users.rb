class AddCreatorIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :creator_id, :integer
  end
end
