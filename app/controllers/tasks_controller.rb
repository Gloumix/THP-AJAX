class TasksController < ApplicationController

    def index
        @tasks = Task.all
        @categories = Category.all
    end

    def new
        @task = Task.new
        @category = Category.new
      
    end

    def create 
       
        @task = Task.new(title: params[:title], deadline: params[:deadline])
        @find_cat = Category.find(params[:category_title].to_i)
       
        @task.category = @find_cat
        @task.save
        respond_to do |format|
            format.html { redirect_to tasks_path }
            format.js {}
        end
    end

    private

    def task_params
        params.require(:task).permit(:title, :deadline)
    end

    def category_params
        params.permit(:category).permit(:category_title)
    end

end
