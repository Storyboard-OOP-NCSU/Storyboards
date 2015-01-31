class Developer < ActiveRecord::Base
  belongs_to :project
  belongs_to :story
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true
  validates :project, :presence => true
end
