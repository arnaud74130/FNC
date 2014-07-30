class AddConsultatonIdToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :consultation_id, :integer
  end
end
