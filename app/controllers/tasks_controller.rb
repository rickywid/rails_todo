class TasksController < ApplicationController

	def create
		@list = List.find(params[:id])
		@task = @list.tasks.new(task_params)
		if @task.save
			redirect_to @list
		else
			@task_count = @list.tasks
			@completed_true = @task_count.where(completed: true)
			@completed_false = @task_count.where(completed: false)
			render "lists/show"
		end
	end

	def complete
		@list = List.find(params[:list_id])
		@task = Task.find(params[:id])
		if @task.update_attribute(:completed, true)
			redirect_to @list

		end
	end


	private
		def task_params
			params.require(:task).permit(:task, :list_id)
		end
end

