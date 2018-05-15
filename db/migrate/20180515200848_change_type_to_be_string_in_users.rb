class ChangeTypeToBeStringInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :type, :string
  end
end
