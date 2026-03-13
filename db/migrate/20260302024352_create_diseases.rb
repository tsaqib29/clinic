class CreateDiseases < ActiveRecord::Migration[8.1]
  def change
    create_table :diseases do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
