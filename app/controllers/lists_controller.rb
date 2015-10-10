class ListsController < ApplicationController

	def index
		@list_count = List.count
		@lists = List.all
		@list = List.new
	end

	def new
	end

	def show
		@list = List.find(params[:id])
		@task = Task.new
		@task_count = @list.tasks
		@completed_true = @task_count.where(completed: true)
		@completed_false = @task_count.where(completed: false)
	end

	
	def create
		@list = List.new(list_params)
		if @list.save
			flash[:success] = "List added successfully"
			redirect_to root_url
		else
			@lists = List.all
			@list_count = List.count
			render "index"
		end
	end

	def edit
		@lists = List.all
		@list = List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
		@list.update(list_params)
		if @list.save
			flash[:success] = "List name updated"
			redirect_to root_url
		else
			render 'edit'
		end
	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		flash[:success] = "List deleted successfully"
		redirect_to root_url
	end

	private
		def list_params
			params.require(:list).permit(:title, :body)
		end
end
