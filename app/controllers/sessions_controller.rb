class SessionsController < ApplicationController
  before_action :check_login, only: [:create, :new]

    def new
        
    end
    
    def create
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        login @user
        redirect_to root_path
      else
        redirect_to login_path, "Your user or password is wrong"
      end 
    end

    def destroy
      session.delete(:user_id)
      @current_user = nil
      redirect_to login_path
    end

    private 
    def check_login
      if logged_in?
        redirect_to root_path, notice: "You are already login"
      end
    end
    
end
