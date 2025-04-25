class TasksController < ApplicationController
  def create
    @task = collection.build(task_params)

    if @task.save
      flash.now[:notice] = "Task created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if resource.update(task_params)
      flash.now[:notice] = "Task updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    resource.destroy

    if resource.destroyed?
      flash.now[:notice] = "Task deleted successfully"
      redirect_to parent, status: :see_other
    else
      flash.now[:error] = "Task was not deleted"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def parent
    @project ||= Project.find(params[:project_id])
  end

  def collection
    parent.tasks
  end

  def resource
    @task ||= collection.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :status)
  end
end
