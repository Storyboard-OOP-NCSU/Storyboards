class CreateStories < ActiveRecord::Migration
  def up
    create_table :stories do |t|
      t.string "title"
      t.text "description"
      t.integer "point_value", default: 1
      t.string "stage", default: "Analysis"
      t.integer "project_id"  #foreign key

      t.timestamps
    end
  end

  def down
  	drop_table :stories
  end
end
