module SessionsHelper

  def login user
    if user.present?
        session[:user_id] = user.id
    end
  end

  def current_user
    if session[:user_id].present?
      @current_user = User.find(session[:user_id])
    end 
  end

  def logged_in?
    current_user.present?
  end
  
  
end
