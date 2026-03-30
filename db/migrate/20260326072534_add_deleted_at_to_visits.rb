class AddDeletedAtToVisits < ActiveRecord::Migration[8.1]
  def change
    add_column :visits, :deleted_at, :datetime
  end
end
