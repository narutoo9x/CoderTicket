class SessionsController < ApplicationController
  def new
  end

  def create
  	if @user = User.find_by_email(params[:name]) || User.find_by_name(params[:name])
  		if @user.authenticate(params[:password])
  			session[:user_id] = @user.id
  			flash[:success] = 'Login successfully.'
  			redirect_to root_path
  		else
  			flash.now[:error] = 'User name or password was wrong.'
  			render :new
  		end
  	else
  		flash.now[:error] = "User doesn't existed!"
  		render :new
  	end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Log out sucessfully.'
    redirect_to root_path
  end
end
