class TasksController < ApplicationController
  def index
  end

  def create
    @task = Task.new(params.require(:task).permit(:todo))
    @task.save
    
    redirect_to @task
  end
end
