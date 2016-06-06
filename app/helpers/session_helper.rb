module SessionHelper

  def current_user
    if logged_in?
      @current_user = User.first || User.find(session[:user_id]) 
    end
  end

  def logged_in?
    session[:user_id] || User.first
  end
end