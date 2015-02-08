class SessionController < ApplicationController
  
  #before_action :confirm_logged_in, except: [:create, :destroy]

  def new
  end

  def create
 		session[:position] = params[:position]
	  if session[:position] == ['Admin']
 	  	if admin = Admin.authenticate(params[:name], params[:password])
  	    session[:admin_id] = admin.id
 	    	redirect_to admin
  	  else
      	redirect_to login_url
 	  	end
		elsif session[:position] == ['Developer']
				if developer = Developer.authenticate(params[:name], params[:password])
  	    	session[:developer_id] = developer.id
 	    		redirect_to developer
  	 		else
      		redirect_to login_url
 	  		end
		else
				redirect_to login_url
		end
  end

  def destroy
    session[:admin_id] = nil
    session[:developer_id] = nil
    session[:position] = nil
    redirect_to login_url
  end
end
