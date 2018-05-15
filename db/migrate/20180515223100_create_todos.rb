class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.text :items
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
