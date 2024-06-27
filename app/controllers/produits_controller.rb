class ProduitsController < ApplicationController
  def index
    @produits = Produit.all
  end

  def show
  end

  def new
    @produit = Produit.new
  end

  def edit
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
      redirect_to @produit, notice: 'Article bien modifié !'
    else
      render :edit
    end
  end

  def destroy
    @produit.destroy
    redirect_to produits_url, notice: 'Article bien supprimé !'
  end

  private

  def set_produit
    @produit = Produit.find(params[:id])
  end

  def produit_params
    params.require(:produit).permit(:nom, :description, :prix, :image)
  end
end
