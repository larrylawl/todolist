class TasksController < ApplicationController
  def index
    @task = Task.new
    if params[:tag]
      @untagged = Task.tagged_with(params[:tag], :exclude => true)
      respond_js
    else
      @tasks = Task.all.order(:id)
    end
  end

  def create
    @task = Task.create(tasks_params)
    if @task.save
      respond_js
    else
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
    @subtasks = @task.subtasks
    respond_js
  end

  def edit
    @task = Task.find(params[:id])
    respond_js
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_params)
      respond_js
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy 
    respond_js
  end

  def completed
    @task = Task.find(params[:id])
    @task.update(tasks_params_complete)
  end

  private
  	def tasks_params
  	  params.require(:task).permit(:title, :tag_list, :details)
  	end

    def tasks_params_complete
      params.require(:task).permit(:completed)
    end

    def respond_js
      respond_to do |format|
        format.js
      end
    end
end
