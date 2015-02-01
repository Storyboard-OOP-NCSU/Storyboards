class Story < ActiveRecord::Base
  belongs_to :project
  has_many :developers
  validates :title, :presence => true
  validates :description, :presence => true
  validates :point, :presence => true
  validates :stages, :presence => true
  validates :project, :presence => true
end
