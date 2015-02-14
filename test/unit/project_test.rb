require 'test_helper'
class ProjectTest < ActiveSupport::TestCase
 test "project should have title and description" do
 project = Project.new
 assert_not project.save
 end
 test "project with title, description, developer and story should be saved" do
 project = Project.new
 project.title = "some title"
 project.description = "Some description"
 project.stories = stories
 project.developers = developers
 assert project.save
 end
end