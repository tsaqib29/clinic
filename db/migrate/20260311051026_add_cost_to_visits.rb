class AddCostToVisits < ActiveRecord::Migration[8.1]
  def change
    add_column :visits, :cost, :integer
  end
end
