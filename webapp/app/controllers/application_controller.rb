class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  WillPaginate.per_page = 10
  
private

  def current_user
    if @current_user
      return @current_user
    end

    if session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
      if @current_user
        return @current_user
      else
        session[:user_id] = nil
        return nil
      end
    end
  end

protected 

  def check_logged_in
    redirect_to login_path, notice: "You need to be logged in to perform that action" unless current_user
  end


  helper_method :current_user
end
