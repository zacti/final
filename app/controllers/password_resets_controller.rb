class PasswordResetsController < ApplicationController
  	def new
	end

	  def create
	  	user = User.find_by_email(params[:email])
	  	user.send_password_reset if user
	  	redirect_to root_path, :notice => "Check Your Email For Reset Password"
	  end

	  def edit
	  	@user = User.find_by_password_reset_token!(params[:password_reset_token])
	  end

	  def update
	  	@user = User.find_by_password_reset_token!(params[:password_reset_token])
	  	if @user.password_reset_sent_at <=> 2.hours.ago
	  		redirect_to new_password_reset_path , :alert =>"Password reset has expired."
	  	elsif @user.update_attributes(user_params)
	  		redirect_to root_path, :notice => "Password has been reset!"
	  	else
	  		redirect_to edit_password_reset_path
	  end
	end

	def show
	end
end

private
	def user_params
    	params.require(:user).permit(:password_digest,:password, :password_confirmation)
    end