class CreateProduits < ActiveRecord::Migration[7.1]
  def change
    create_table :produits do |t|
      t.string :nom
      t.string :description
      t.decimal :prix
      t.string :image

      t.timestamps
    end
  end
end
