class CreateAddEffortToStories < ActiveRecord::Migration
  def up
    add_column "stories", "effort", :integer
  end

  def down
    remove_column "stories", "effort"
  end
end
