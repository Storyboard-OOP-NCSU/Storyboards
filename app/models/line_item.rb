class LineItem < ActiveRecord::Base
	belongs_to :story
	belongs_to :developer
end
