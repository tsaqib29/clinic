class AddPatientToVisits < ActiveRecord::Migration[8.1]
  def change
    add_reference :visits, :patient, foreign_key: true
  end
end
