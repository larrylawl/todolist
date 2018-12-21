class TasksController < ApplicationController
  def index
  end

  def create
    @task = Task.new(tasks_params)
    @task.save

    redirect_to :action => "index"
  end

  private
  	def tasks_params
  	  params.require(:task).permit(:todo)
  	end
end
