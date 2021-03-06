class Project < ActiveRecord::Base
  has_many :developers
  has_many :stories, :dependent => :destroy
  validates :title, :presence => true
  validates :description, :presence => true
  
  def sum_point
  	points = {'Analysis' => 0, 'Ready For Dev' => 0, 'In Dev' => 0,
  			 'Dev Complete' => 0, 'In Test' => 0, 'Complete' => 0}
  	stories.each do |story|
  		points[story.stages] += story.point
    end
    points
  end
  
  end
