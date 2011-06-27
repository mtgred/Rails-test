class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.references :user
      t.references :account
      t.date :day
      t.integer :hours

      t.timestamps
    end
    add_index :timesheets, :user_id
    add_index :timesheets, :account_id
  end
end
