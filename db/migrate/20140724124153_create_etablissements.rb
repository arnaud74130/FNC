class CreateEtablissements < ActiveRecord::Migration
  def change
    create_table :etablissements do |t|
      t.string :nom

      t.timestamps
    end
  end
end
