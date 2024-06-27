class SessionsController < ApplicationController
  
  def index
    @user = User.new
  end


  def create
    user = User.find_by(email: params[:email])
    if (user.nil? == false) 
      if user.authenticate(params[:password]) 
        # puts user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Thanks for logging in!"
        redirect_to(:controller =>'produits', :action =>'index')
      else 
        # puts user.authenticate(params[:password])
        flash[:error] = "There was an error logging in. Please check your email and password"
        render action: "index"
      end
    else
      flash[:error] = "There was an error logging in. Please check your email and password"
      render action: "index"
    end
  end

  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     log_in user
  #     redirect_to root_path
  #   else
  #     flash.now[:alert] = 'Email ou mot de passe invalide'
  #     render 'index'
  #   end
  # end

  def destroy
    log_out
    redirect_to root_path
  end
end
