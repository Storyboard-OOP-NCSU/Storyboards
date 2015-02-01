class SessionController < ApplicationController
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
		else
			if session[:position] == ['Developer']
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
  end

  def destroy
    session[:admin_id] = nil
    session[:developer_id] = nil
    redirect_to login_url
  end
end
