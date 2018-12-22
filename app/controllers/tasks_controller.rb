class TasksController < ApplicationController
  def index
    if params[:tag]
      @tasks = Task.tagged_with(params[:tag])
    else
      @tasks = Task.all
    end
  end

  def new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      redirect_to :action => "index"
    else
      render "new"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(tasks_params)
      redirect_to :action => "index"
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to :action => "index"
  end

  private
  	def tasks_params
  	  params.require(:task).permit(:todo, :tag_list)
  	end
end
