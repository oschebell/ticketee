class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
  @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)

    if @project.save
      flash[:notice] = "Project has been updated."
    redirect_to @project
    else
      flash.now[:alert] = "Project has not been updated."
      render "edit"
    end
  end


  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been created."
      render "new"
    end
  end

end

private

def project_params
  params.require(:project).permit(:name, :description)
end
