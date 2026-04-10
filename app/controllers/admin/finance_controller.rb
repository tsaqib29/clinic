class Admin::FinanceController < ApplicationController

  def index

    @visits = Visit.includes(:patient).order(visit_date: :desc)

    @today_income = Visit.where(
      visit_date: Date.today
    ).sum(:cost)

    @month_income = Visit.where(
      visit_date: Date.today.beginning_of_month..Date.today.end_of_month
    ).sum(:cost)

    @total_income = Visit.sum(:cost)

  end

end
