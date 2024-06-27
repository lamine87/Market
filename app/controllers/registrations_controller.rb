class RegistrationsController < ApplicationController
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
      flash[:notice] = 'Inscription réussi!'   
      redirect_to(:controller =>'produits', :action =>'index')
      # redirect_to root_path   
    else   
      flash[:error] = 'Échec de la modification de l\'utilisateur !'   
      render :new   
    end  
  end

   # GET /users/:id/edit
  def edit
    set_user
  end

    # PATCH /users/:id
  def update
    if @user.update(user_params)
      flash[:notice] = 'L\'utilisateur a été mis à jour avec succès !'   
      redirect_to root_path   
    else
      flash[:error] = 'Échec de la modification du l\'utilisateur!'   
      render :edit
    end
  end

  def destroy
    @user.destroy
    if @user.destroyed?
      flash[:notice] = 'Utilisateur supprimé avec succès !'
    else
      flash[:error] = 'Échec de la suppression de l\'utilisateur !'
    end
    redirect_to root_path
  end

  # private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  # Autoriser uniquement une liste de paramètres.
  def user_params
    params.require(:user).permit( :prenom, :nom, :email, :password, :password_confirmation)
  end
end
