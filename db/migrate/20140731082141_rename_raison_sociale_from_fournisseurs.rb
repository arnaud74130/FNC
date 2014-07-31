class RenameRaisonSocialeFromFournisseurs < ActiveRecord::Migration
  def change
  	rename_column :fournisseurs, :raison_sociale, :nom
  end
end
