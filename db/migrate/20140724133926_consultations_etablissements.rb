class ConsultationsEtablissements < ActiveRecord::Migration
  def change
  	create_table :consultations_etablissements do |t|
      t.string :consultation_id
      t.string :etablissement_id
    end
  end
end
