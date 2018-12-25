class SubtasksController < ApplicationController
	def create
    byebug
    @subtask = Subtask.new(subtasks_params)
    if @subtask.save
      respond_js
    else
      render "new"
    end
  end

  private
  	def subtasks_params
  	  params.require(:subtask).permit(:todo, :tag_list)
  	end

    def respond_js
      respond_to do |format|
        format.js
      end
    end
end

