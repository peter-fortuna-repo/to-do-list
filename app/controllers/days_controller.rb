class DaysController < ApplicationController
    def index
        @days = Day.order(date: :desc)
    end
    def show
        @day = Day.find(params[:id])
        @tasks = @day.tasks
        @task = Task.new
        @today = Day.find_or_create_by(date: Date.today)
    end
end