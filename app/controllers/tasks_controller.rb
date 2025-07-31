class TasksController < ApplicationController
    def index
        @tasks = Task.order(:completed, :title)
        @task = Task.new
        @today = Day.find_or_create_by(date: Date.today)
    end

    def create
        @task = Task.new(task_params)
        @task.completed = false
        if @task.save
            flash[:notice] = 'Task was successfully created.'
        else
            flash[:notice] = @task.errors.full_messages
        end
        redirect_back(fallback_location: root_path)
    end

    def update
      @task = Task.find(params[:id])
      if params[:day_id]
        # Move to today or another day
        if @task.update(day_id: params[:day_id])
          flash[:notice] = 'Task moved to new day.'
        end
      elsif params[:completed]
        # Update completed status
        if @task.update(completed: !@task.completed)
          flash[:notice] = 'Task completion updated.'
        end
      end
      redirect_back(fallback_location: root_path)
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        flash[:notice] = 'Task was successfully deleted.'
        redirect_back(fallback_location: root_path)
    end

    private

    def task_params
        permitted = params.require(:task).permit(:title, :completed, :day_id)
        permitted
    end

end