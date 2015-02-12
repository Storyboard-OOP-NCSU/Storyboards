class Developer < ActiveRecord::Base
  belongs_to :project
  has_one :line_item, :dependent => :destroy
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true
  validates :project, :presence => true
  
  class << self
    def authenticate(email, password)
    	user = nil
    	Developer.all.each do |developer|
      	if developer.email == email and 
      		developer.password == password
          	user = developer
      	end
      end
      user
    end
  end
end
