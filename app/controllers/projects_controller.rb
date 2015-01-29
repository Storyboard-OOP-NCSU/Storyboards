class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new(:title => 'Project 1')
    @project_count = Project.count + 1
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to(:action => 'index')
    else
      @project_count = Project.count
      render('new')
    end
  end

  def edit
    @project = Project.find(params[:id])
    @project_count = Project.count
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      #insert flash notice
      redirect_to(:action => 'show', :id => @project.id)
    else
      @project_count = project_count
      render('edit')
    end
  end

  def delete
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    #insert flash notice
    redirect_to(:action => 'index')
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :created_at)
  end
end
