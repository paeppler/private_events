class AddCreatorIdToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :creator_id, :integer
    remove_column :users, :creator_id

  end
end
