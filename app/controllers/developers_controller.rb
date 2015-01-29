class DevelopersController < ApplicationController
  def index
    @developers = Developer.all
  end

  def show
    @developer = Developer.find(params[:id])
  end

  def new
    @developer = Developer.new(:name => 'Developer')
    @developer_count = Developer.count + 1
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      redirect_to(:action => 'index')
    else
      @developer_count = Developer.count + 1
      render('new')
    end
  end

  def edit
    @developer = Developer.find(params[:id])
    @developer_count = Developer.count
  end

  def update
    @developer = Developer.find(params[:id])
    if @developer.update_attributes(admin_params)
      #insert flash notice
      redirect_to(:action => 'show', :id => @developer.id)
    else
      @developer_count = Developer.count
      render('edit')
    end
  end

  def delete
    @developer = Developer.find(params[:id])
  end

  def destroy
    @developer = Developer.find(params[:id])
    @developer.destroy
    #indert flash notice
    redirect_to(:action => 'index')
  end

  private
  def developer_params
    params.require(:developer).permit(:name, :email, :created_at)
  end
end
