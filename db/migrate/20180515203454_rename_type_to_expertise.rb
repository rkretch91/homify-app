class RenameTypeToExpertise < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :type, :expertise
  end
end
