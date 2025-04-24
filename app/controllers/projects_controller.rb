class ProjectsController < ApplicationController
  def index
    @projects = collection.page(params[:page])
  end

  private

  def collection
    Project.all
  end
end
