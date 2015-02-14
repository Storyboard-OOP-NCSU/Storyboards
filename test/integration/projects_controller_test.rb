require 'test_helper'
class ProjectsControllerTest < ActionDispatch::IntegrationTest
test "should get new" do
 get '/projects/new'
 assert_response :success
 end
 test "should create project" do
 get '/projects/new'
 assert_response :success
 assert_difference 'Project.count' do
 post '/projects, project: {name: "New Project"}
 end
 end
 test "should get index" do
 get '/projects'
 assert_response :success
 assert_not_nil assigns(:projects)
 end
test "should show project" do
 get '/projects/' + @project.id.to_s
 assert_response :success
end
test "should get edit" do
 get '/projects/' + @project.id.to_s + "/edit"
 assert_response :success
end
test "should update project" do
 put '/projects/' + @project.id.to_s, project: @project.attributes
 assert_redirected_to project_path(assigns(:project))
end
test "should destroy project" do
 assert_difference('Project.count', -1) do
 delete '/projects/' + @project.id.to_s
 end
 assert_redirected_to project_path
end
end