class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Merci de vous être connecté !"
      redirect_to(:controller =>'produits', :action =>'index')
    else
      flash[:error] = 'Email ou mot de passe invalide !'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Vous avez été déconnecté."
    redirect_to(:controller =>'page', :action =>'home')
  end


end
