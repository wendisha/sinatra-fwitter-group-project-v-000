class User < ActiveRecord::Base
  has_many :tweets
  validates_presence_of :username, :email, :password
  has_secure_password
  
      
  def slug 
    username.gsub(" ", "-").downcase
  end
  
  def find_by_slug
    self.all.find{|username| username.slug == slug}
  end
end