class Developer < ActiveRecord::Base
  belongs_to :project
  has_one :line_item, :dependent => :destroy
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true
  validates :project, :presence => true
  
  class << self
    def authenticate(name, password)
      if developer = find_by_name(name)
        if developer.password == password
          developer
        end
      end
    end
  end
end
