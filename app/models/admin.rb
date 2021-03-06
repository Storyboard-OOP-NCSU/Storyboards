class Admin < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true
  class << self
    def authenticate(email, password)
    	user = nil
    	Admin.all.each do |admin|
      	if admin.email == email and 
      		admin.password == password
          	user = admin
      	end
      end
      user
    end
  end
end
