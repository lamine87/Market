class PageController < ApplicationController
  def home
    I18n.locale = :fr
    @produits = Produit.order(created_at: :desc)
    Rails.logger.info "Current locale: #{I18n.locale}" 
  end
end
