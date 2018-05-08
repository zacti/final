class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.where(email: params[:email]).first
	  	if user && user.authenticate(params[:password])
		    session[:user_id] = user.id # important to only store userid in cookie(session) and not other information of the user to not have too big a cookie and risk "cookie overflow".
		    flash[:notice] = "Welcome, you've logged in."
		    redirect_to root_path
	  else
	    	flash[:error] = "There is something wrong with your username or password."
	    	redirect_to login_path
	  end
	end
	
	def edit
	end

	def destroy
	  session[:user_id] = nil
	  flash[:notice] = "You've logged out."
	  redirect_to root_path
	end
end
