class CreateLineItems < ActiveRecord::Migration
  def up
    create_table :line_items do |t|
      t.integer :story_id
      t.integer :developer_id

      t.timestamps
    end
  end

  def down
  	drop_table :line_items
  end
end
