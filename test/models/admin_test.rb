require 'test_helper'
class AdminTest < ActiveSupport::TestCase
 test"admin should have name, email and password" do
 admin = Admin.new
 assert_not admin.save
 end
 test "admin with name, email, password should be saved" do
 admin = Admin.new
 admin.name = "some name"
 admin.email = "Some email"
 admin.password = "Some password"
 assert admin.save
 end
 end