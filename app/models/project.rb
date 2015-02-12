class Project < ActiveRecord::Base
  has_many :developers
  has_many :stories, :dependent => :destroy
  validates :title, :presence => true
  validates :description, :presence => true
  
  def sum_point(stage)
  	s = 0
  	stories.each do |story|
      if story.stages == stage
  		s = s + story.point
  	end
    end
    s
  end
  end
