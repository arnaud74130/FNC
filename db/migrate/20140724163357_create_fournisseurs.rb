class CreateFournisseurs < ActiveRecord::Migration
  def change
    create_table :fournisseurs do |t|
      t.string :code
      t.string :raison_sociale
      t.string :email

      t.timestamps
    end
  end
end
