require 'test_helper'
class StoriesControllerTest < ActionDispatch::IntegrationTest
test "should get new" do
 get '/stories/new'
 assert_response :success
 end
 test "should create story" do
 get '/stories/new'
 assert_response :success
 assert_difference Story.count' do
 post '/stories, story: {name: "New Story"}
 end
 end
 test "should get index" do
 get '/stories'
 assert_response :success
 assert_not_nil assigns(:stories)
 end
test "should show story" do
 get '/stories/' + @story.id.to_s
 assert_response :success
end
test "should get edit" do
 get '/stories/' + @story.id.to_s + "/edit"
 assert_response :success
end
test "should update story" do
 put '/stories/' + @story.id.to_s, story: @story.attributes
 assert_redirected_to stories_path(assigns(:story))
end
test "should destroy story" do
 assert_difference(Story.count', -1) do
 delete '/stories/' + @story.id.to_s
 end
 assert_redirected_to stories_path
end
end