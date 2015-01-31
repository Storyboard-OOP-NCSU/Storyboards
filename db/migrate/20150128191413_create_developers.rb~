class CreateDevelopers < ActiveRecord::Migration
  def up
    create_table :developers do |t|
      t.string "name"
      t.string "email"
      t.string "password"
      t.integer "project_id"  #foreign key
      t.integer "story_id"  #foreign key
      t.timestamps
    end
  end

  def down
  	drop_table :developers
  end
end
