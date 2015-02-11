class Project < ActiveRecord::Base
  has_many :developers
  has_many :stories, :dependent => :destroy
  validates :title, :presence => true
  validates :description, :presence => true
  
  def sum_point
  	s = 0
  	stories.each do |story|
  		s = s + story.point
  	end
  	s
  end
end
