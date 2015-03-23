class API::TasksController < ApplicationController
	def index
		tasks = Task.all
		render json: tasks, status: 200
	end
	def create
		task = Task.new(task_params)
		if task.save
			render json: task, status: :created
		else
			render json: task.errors, status: 422
		end
	end
	def show
		
	end
	private
		def task_params
			params.require(:task).permit(:task, :status)
		end
end
