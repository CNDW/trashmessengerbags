module SessionsHelper
  
  def sign_in(admin)
    remember_token = Admin.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    admin.update_attribute(:remember_token, Admin.encrypt(remember_token))
    self.current_admin = admin
  end

  def current_admin=(admin)
  	@current_admin = admin
  end

  def current_admin
  	remember_token = Admin.encrypt(cookies[:remember_token])
  	@current_admin ||= Admin.find_by(remember_token: remember_token)
  end

  #don't even check if the remember token doesn't exist to save on db hit
  def signed_in?
  	return !current_admin.nil? if cookies[:remember_token] 
    false
  end

  def sign_out
    current_admin.update_attribute(:remember_token, Admin.encrypt(Admin.new_remember_token))
    cookies.delete(:remember_token)
    self.current_admin = nil
  end
end
