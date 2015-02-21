class Story < ActiveRecord::Base
  belongs_to :project
  has_many :line_items, :dependent => :destroy
  validates :title, :presence => true
  validates :description, :presence => true
  validates :creator, :presence => true
  validates :effort, :presence => true
  validates :point, :presence => true
  validates :stages, :presence => true
  validates :project, :presence => true
  
  def unassign
  	line_items.each do |line_item|
    	line_item.delete
    end
  end

end
