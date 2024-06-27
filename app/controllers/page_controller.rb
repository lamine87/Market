class PageController < ApplicationController
  def home
    @produits = Produit.all
  end
end
