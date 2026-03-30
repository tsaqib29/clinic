class AddScheduleToVisits < ActiveRecord::Migration[8.1]
  def change
    add_column :visits, :visit_time, :time
  end
end
