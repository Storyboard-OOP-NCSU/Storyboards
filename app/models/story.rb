class Story < ActiveRecord::Base
  belongs_to :project
  has_many :developers
  validates :title, :presence => true
  validates :description, :presence => true
  validates :point, :presence => true
  validates :stages, :presence => true
  validates :project, :presence => true
  
  class << self
    def checkstatus
    	Story.all.each do |story|
    		if story.project == nil
    			story.destroy
    		end
   		end
    end
    def delete_developer
      Story.all.each do |story|
        if story.developers.length == 2
          other = story.developers[[0,1].sample]
          story.developers.delete(other)
        end
      end
    end
  end
end
