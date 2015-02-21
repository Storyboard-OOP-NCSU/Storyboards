class CreateAdmins < ActiveRecord::Migration
  def up
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end

  def down
  	drop_table :admins
  end
end