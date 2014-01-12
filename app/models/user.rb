require 'bcrypt'
class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
    
  after_destroy :ensure_an_admin_remains
  
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end
    
    def create_admin_on_empty_db
      if User.count.zero?
        self.user = User.new
        self.user.name = "admin"
      end
    end
      
end
