class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :code
      t.integer :fournisseur_id

      t.timestamps
    end
  end
end
