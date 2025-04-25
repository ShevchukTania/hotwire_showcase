class Tasks::NamesController < ApplicationController
  def edit
    @task = task
  end

  def update
    if task.update(name_params)
      redirect_to project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def project
    @project ||= task.project
  end

  def task
    @task ||= Task.find(params[:task_id])
  end

  def name_params
    params.permit(:name)
  end
end