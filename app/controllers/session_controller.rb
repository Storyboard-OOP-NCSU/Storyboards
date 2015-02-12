class SessionController < ApplicationController

  def new
  end

  def create
 		session[:position] = params[:position]
    respond_to do |format|
  	  if session[:position] == ['Admin']
   	  	if admin = Admin.authenticate(params[:email], params[:password])
    	    session[:admin_id] = admin.id
          format.html { redirect_to admin, notice: "Login in successfully!" }
    	  else     
          format.html { redirect_to login_url, notice: "Invaild login!" }
   	  	end
  		elsif session[:position] == ['Developer']
  			if developer = Developer.authenticate(params[:email], params[:password])
    	    session[:developer_id] = developer.id
          format.html { redirect_to developer, notice: "Login in successfully!" }
    	 	else
        	format.html { redirect_to login_url, notice: "Invaild login!" }
   	  	end
  		else
  				format.html { redirect_to login_url, notice: "Invaild login!" }
  		end
    end
  end

  def destroy
    session[:admin_id] = nil
    session[:developer_id] = nil
    session[:position] = nil
    redirect_to login_url
  end
end
