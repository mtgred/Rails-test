class CreateAccountCategories < ActiveRecord::Migration
  def change
    create_table :account_categories do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
