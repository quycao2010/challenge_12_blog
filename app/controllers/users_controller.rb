class UsersController < ApplicationController

  def new
    @user = User.new
  end
      
  def create
    @user = User.create(user_params)
    if @user.save
      login(@user)
      redirect_to root_path, notice: "Signup successfully"
    else
      render :new
    end
  end
      
  private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

