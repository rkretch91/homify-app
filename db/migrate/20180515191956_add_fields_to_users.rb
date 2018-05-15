class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :status, :string
    add_column :users, :type, :boolean
    add_column :users, :profession, :string
    add_column :users, :service, :string
  end
end
