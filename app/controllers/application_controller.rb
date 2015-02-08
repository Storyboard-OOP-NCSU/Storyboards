class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def confirm_logged_in
    unless session[:position]
      #flash[:notice] = "Please log in."
      redirect_to login_url
      return false
    else
      return true
    end
  end
end
