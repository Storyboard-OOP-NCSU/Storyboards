class LineItem < ActiveRecord::Base
	belongs_to :story
	belongs_to :developer
	
	class << self
		def story_line_item_less2?(story)
			story.line_items.empty? or story.line_items.length < 2
		end
	end
end
