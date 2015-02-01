class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.integer :point
      t.string :stages
      t.references :project

      t.timestamps null: false
    end
  end
end
