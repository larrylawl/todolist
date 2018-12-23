class TasksController < ApplicationController
  def index
    if params[:tag]
      @tasks = Task.tagged_with(params[:tag])
    else
      @tasks = Task.all
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
    
  end

  private
  	def tasks_params
  	  params.permit(:todo, :tag_list)
  	end

    def respond_js
      respond_to do |format|
        format.js
      end
    end
end
