class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :office_phone, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :manager_id, :integer
    add_column :users, :department, :string
    add_column :users, :address, :string
    add_column :users, :contractor, :boolean
  end
end
