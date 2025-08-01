class TasksController < ApplicationController
    def index
        @tasks = Task.where(user_id: current_user.id).order(:completed, :title)
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        @task.completed = false
        Rails.logger.debug "-------- @task.inspect -----------_______!!!!!!"
        Rails.logger.debug @task.inspect
        if @task.save
            flash[:notice] = 'Task was successfully created.'
        else
            flash[:notice] = @task.errors.full_messages
            Rails.logger.debug @task.errors.full_messages
        end
        redirect_back(fallback_location: root_path)
    end

    def update
      @task = Task.find(params[:id])
      if params[:date]
        # Move to today or another day
        if @task.update(date: params[:date])
          flash[:notice] = 'Task moved to today.'
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
        params.require(:task).permit(:user_id, :title, :completed, :date, :tag)
    end

end