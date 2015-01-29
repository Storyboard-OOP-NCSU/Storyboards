class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new(:name => 'Admin')
    @admin_count = Admin.count + 1
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      #need insert flash notice
      redirect_to(:action => 'index')
    else
      @admin_count = Admin.count + 1
      render('new')
    end
  end

  def edit
    @admin = Admin.find(params[:id])
    @admin_count = Admin.count
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      #insert flash notice
       redirect_to(:action => 'show', :id => @admin.id)
    else
      @admin_count = Admin.count
      render('edit')
    end
  end

  def delete
    @admin = Admin.find(params[:id])
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    #insert flash notice
    redirect_to(:action => 'index')
  end

  private
  def admin_params
    params.require(:admin).permit(:name, :email, :created_at)
  end
end
