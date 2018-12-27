class TasksController < ApplicationController
  def index
    @task = Task.new
    if params[:tag]
      @tasks = Task.tagged_with(params[:tag])
    else
      @tasks = Task.all.order(:id)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      respond_js
    else
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
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

  private
  	def tasks_params
  	  params.require(:task).permit(:todo, :tag_list)
  	end

    def respond_js
      respond_to do |format|
        format.js
      end
    end
end
