class CreateAppointments < ActiveRecord::Migration[8.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :scheduled_date
      t.string :note
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
