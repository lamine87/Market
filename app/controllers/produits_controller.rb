class ProduitsController < ApplicationController
  before_action :set_produit, :require_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @produits = Produit.order(created_at: :desc)
  end

  def show
    set_produit
  end

  def new
    @produit = Produit.new
  end

  def edit
    set_produit
  end

  def create
    @produit = Produit.new(produit_params)
    if @produit.save
      @produit.image.attach(params[:produit][:image])
      flash[:notice] = 'Article creer avec succès!'   
      redirect_to(:controller =>'produits', :action =>'index')
    else
      flash[:notice] = 'Article non enregistré'   
      render :new
    end
  end

  def update
    if @produit.update(produit_params)
       redirect_to(:controller =>'produits', :action =>'index')
    else
      render :edit
    end
  end

  def destroy
    
    @produit.image.purge if @produit.image.attached? 
    @produit.destroy
    if @produit.destroyed?
      flash[:notice] = 'Article supprimé avec succès !'
      redirect_to(:controller =>'produits', :action =>'index')
    else
      flash[:error] = 'Échec de la suppression d\'Article !'
      redirect_to(:controller =>'produits', :action =>'index')
    end
      
  end

  private

  def set_produit
    @produit = Produit.find_by(params[:id])
  end

  def produit_params
    params.require(:produit).permit(:nom, :description, :prix, :image)
  end
end
