class RemoveManagerFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :manager_id
  end

  def down
    add_column :users, :manager_id, :integer
  end
end
