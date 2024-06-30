class RegistrationsController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  def new
    @user = User.new
  end

    # GET /users/:id
  def show
    set_user
  end


  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Inscription réussi!'   
      redirect_to(:controller =>'produits', :action =>'index')
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  # Autoriser uniquement une liste de paramètres.
  def user_params
    params.require(:user).permit( :prenom, :nom, :email, :password, :password_confirmation)
  end
end
