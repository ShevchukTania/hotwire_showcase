class ProjectsController < ApplicationController
  def index
    @projects = collection.page(params[:page])
    @project = collection.build
  end

  def new
    @project = collection.build(project_params)
  end

  def show
    @project = resource
    @tasks = @project.tasks.active.ordered.page(params[:page])
  end

  def create
    @project = collection.build(project_params)

    if @project.save
      flash.now[:notice] = "Project created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @project = resource
    @project.destroy

    flash.now[:notice] = "Project deleted successfully"
  end

  private

  def collection
    Project.ordered
  end

  def resource
    collection.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :status, :start_date, :end_date)
  end
end
