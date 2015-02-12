require 'test_helper'

class StoryTest < ActiveSupport::TestCase

  test "story should have title, description, stage and point value" do
    story = Story.new
    assert_not story.save
  end

  test "story with title, description, stage, point value, project and line_item should be saved" do
    story = Story.new
    story.title = "some title"
    story.description = "Some description"
    story.stages = "Some stage"
    story.point = "Some point value"
    story.project = projects(:one)
    story.line_items = line_items
    assert story.save
  end

end
