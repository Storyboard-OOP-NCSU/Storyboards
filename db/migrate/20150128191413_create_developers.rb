class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.references :project
      t.references :story

      t.timestamps null: false
    end
  end
end
