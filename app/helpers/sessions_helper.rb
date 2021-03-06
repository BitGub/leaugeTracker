module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def signed_in_user
    unless signed_in?
      redirect_to signin_path, notice: "Please Sign in."
    end
  end
  
end
