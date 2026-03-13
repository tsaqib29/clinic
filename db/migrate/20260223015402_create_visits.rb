class CreateVisits < ActiveRecord::Migration[8.1]
  def change
    create_table :visits do |t|
      t.string :name
      t.string :phone
      t.text :keluhan
      t.date :visit_date

      t.timestamps
    end
  end
end
