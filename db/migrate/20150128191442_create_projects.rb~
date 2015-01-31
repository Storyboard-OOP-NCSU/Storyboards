class CreateProjects < ActiveRecord::Migration
  def up
    create_table :projects do |t|
      t.string "title"
      t.text "description"
      t.timestamps
    end
  end

  def down
  	drop_table :projects
  end
end
