require 'test_helper'
class DevelopersControllerTest < ActionDispatch::IntegrationTest
test "Login and browse site" do
#login via https
 #http!
 get "/login"
 assert_response :success
 post_via_redirect "/login"
 assert_equal '/login', path
 assert_equal 'Invalid login!', flash[:notice]
end
end