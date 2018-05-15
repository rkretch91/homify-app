class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :tags
      t.integer :estimated_duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
