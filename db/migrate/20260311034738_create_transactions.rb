class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.string :patient_name
      t.string :disease
      t.integer :amount
      t.date :date

      t.timestamps
    end
  end
end
