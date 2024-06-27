class Produit < ApplicationRecord
    has_one_attached :image
    validates :nom, presence: true, length: { maximum: 100 }
    validates :description, presence: true
    validates :prix, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :image, presence: true
end
