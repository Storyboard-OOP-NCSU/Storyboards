class CreateDevelopers < ActiveRecord::Migration
  def up
    create_table :developers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.references :project

      t.timestamps null: false
    end
  end

  def down
  	drop_table :developers
  end
end
