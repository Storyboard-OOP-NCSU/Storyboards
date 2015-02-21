class CreateAddCreatorToStories < ActiveRecord::Migration
  def up
	 add_column "stories", "creator", :string
  end

  def down
  	remove_column "stories", "creator"
  end
end
