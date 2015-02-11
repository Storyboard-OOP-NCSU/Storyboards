class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :story_id
      t.integer :developer_id

      t.timestamps
    end
  end
end
