class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(tasks_params)
    @task.save

    redirect_to :action => "index"
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to :action => "index"
  end

  private
  	def tasks_params
  	  params.require(:task).permit(:todo)
  	end
end
