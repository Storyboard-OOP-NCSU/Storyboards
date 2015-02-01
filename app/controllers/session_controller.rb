class SessionController < ApplicationController
  # attr_reader :admin
  def new
  end

  def create
    if admin = Admin.authenticate(params[:name], params[:password])
      session[:admin_id] = admin.id
      redirect_to admin
    else
      redirect_to login_url, :alert => 'Invalid user/password combination'
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to login_url, :notice => 'Logged out'
  end
end
