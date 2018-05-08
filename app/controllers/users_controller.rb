class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save 
			session[:user_id] = @user.id
    		flash[:notice] = "You are registered."
			redirect_to root_url
		else
			flash[:notice] = "Invalid email or password"
			redirect_to new_user_path
		end
	end

	def google_oauth2
	    @user = User.from_omniauth(request.env['omniauth.auth'])          
	    session[:user_id] = @user.id                                       
	    redirect_to root_path                                        
	end

	private
	def user_params
	  params.require(:user).permit(:email,:password_confirmation ,:password,:password_digest, :_destroy)
	end 
end