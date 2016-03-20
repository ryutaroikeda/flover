class SessionsController < ApplicationController
  def create
    logger.debug request.env['omniauth.auth']
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
    rescue
      flash[:warning] = "Login unsuccessful."
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'Logout successful.'
    end
    redirect_to root_path
  end

  def auth_failure
    redirect_to root_path
  end
end
