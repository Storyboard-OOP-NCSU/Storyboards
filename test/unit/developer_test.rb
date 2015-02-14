require 'test_helper'
class DeveloperTest < ActiveSupport::TestCase
 test"developer should have name, email and password" do
 developer = Developer.new
 assert_not developer.save
 end
 test "developer with name, email, password, project and story should be saved" do
 developer = Developer.new
 developer.name = "some name"
 developer.email = "Some email"
 developer.password = "Some password"
 developer.project = projects(:one)
 developer.line_item = line_items(:one)
 assert developer.save
end
end