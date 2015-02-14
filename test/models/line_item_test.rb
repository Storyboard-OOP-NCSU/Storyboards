require 'test_helper'
class LineItemTest < ActiveSupport::TestCase
 test "line_item should be saved with one developer and one story" do
 line_item = LineItem.new
 line_item.developer = developers(:one)
 line_item.story = stories(:one)
 assert line_item.save
 end
end