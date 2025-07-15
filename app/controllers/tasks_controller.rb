class TasksController < ApplicationController
    def index
        @tasks = Task.order(:completed, :title)
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        @task.completed = false
        Rails.logger.info @task.inspect
        if @task.save
            redirect_to tasks_path, notice: 'Task was successfully created.'
        else
            Rails.logger.info @task.errors.full_messages
            render :new
        end
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to tasks_path, notice: 'Task was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path, notice: 'Task was successfully deleted.'
    end

    private

    def task_params
        params.require(:task).permit(:title, :completed)
    end

end