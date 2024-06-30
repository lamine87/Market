class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  PRODUIT_PAGE = 3
  PRODUIT_PAGE_ADMIN = 3

  def index
    @page = params.fetch(:page, 0).to_i
    @user = User.offset(@page * PRODUIT_PAGE).limit(PRODUIT_PAGE).order(created_at: :desc)
  end


  # GET /users/:id
  def show
    set_user
  end

  # GET /users/:id/edit
  def edit
    set_user
  end

  # PATCH /users/:id
  def update
    if @user.update(user_params)
      flash[:notice] = 'L\'utilisateur a été mis à jour avec succès !'   
      redirect_to(:controller =>'users', :action =>'index')
    else
      flash[:error] = 'Échec de la modification du l\'utilisateur!'   
      render :edit
    end
  end

      
    def destroy
      if @user
        if @user.destroy
          flash[:success] = 'Utilisateur supprimé avec succès !'
          redirect_to(:controller =>'users', :action =>'index')
        else
          flash[:error] = 'Échec de la suppression de l\'utilisateur !'
          redirect_to(:controller =>'users', :action =>'index')
        end
      else
        flash[:error] = 'Utilisateur introuvable !'
        redirect_to(:controller =>'users', :action =>'index')
      end
    end

    def new
      @page = params.fetch(:page, 0).to_i
      @user = User.offset(@page * PRODUIT_PAGE_ADMIN).limit(PRODUIT_PAGE_ADMIN).order(created_at: :desc)
    end
  
    def make_admin_form
      @user = User.find_by(params[:id])
    end
  
    def makeAdmin
      @user = User.find_by(params[:id])
      if @user.update(admin: true)
        flash[:success] = 'Utilisateur mis à jour en administrateur avec succès !'
        redirect_to users_path
      else
        flash[:error] = 'Erreur lors de la mise à jour en administrateur.'
        render :make_admin_form
      end
    end

    

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end


  # Autoriser uniquement une liste de paramètres.
  def user_params
    params.require(:user).permit(:prenom, :nom, :email, :password, :password_confirmation)
  end
end
