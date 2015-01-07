class UsersController < ApplicationController
  layout 'signup', only: [:new]
   
  def new
    @user = User.new
  end
  
  def edit
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the League Tracker!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
  end
  
    private
  
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

end