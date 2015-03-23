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
	def update
		task = Task.find(params[:id])
	      if task.update(task_params)
	      	render json: task, status: :ok
	      else
	      	render json: task, status: :unprocessable_entity 
	      end
    end

    def destroy
    	task = Task.find(params[:id])
	  	task.destroy
	  		if task.destroy
	  			render json: task, status: :ok
	  		else
	  			render json: task, status: :unprocessable_entity 
	  		end

    end
	private
		def task_params
			params.require(:task).permit(:body, :status)
		end
end