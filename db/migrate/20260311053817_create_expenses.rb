class CreateExpenses < ActiveRecord::Migration[8.1]
  def change
    create_table :expenses do |t|
      t.string :description
      t.integer :amount
      t.date :date

      t.timestamps
    end
  end
end
