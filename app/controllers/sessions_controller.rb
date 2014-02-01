class SessionsController < ApplicationController
  include SessionsHelper
  skip_before_filter :authorize
  
  def new
  end

  def create
    admin = Admin.find_by_name(params[:session][:name])
    if admin and admin.authenticate(params[:session][:password])
      sign_in admin
      redirect_to custom_items_url, notice: "Logged in"
    else
      flash[:error] = 'Invalid admin/password comination'
      render 'new'
    end  
  end

  def destroy
    sign_out
    redirect_to custom_items_url, notice: "Logged out"
  end
  
  private 

end
