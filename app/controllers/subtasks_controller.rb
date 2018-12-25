class SubtasksController < ApplicationController
	def create
    @task = Task.find(params[:task_id])
    @subtask = @task.subtasks.create(subtasks_params)
    if @subtask.save
      respond_js
    else
      render "new"
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    @subtask = @task.subtasks.find(params[:id])
    @subtask.destroy
    respond_js
  end

  private
  	def subtasks_params
  	  params.require(:subtask).permit(:todo)
  	end

    def respond_js
      respond_to do |format|
        format.js
      end
    end
end

