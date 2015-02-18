class AdminsController < ApplicationController
  before_action :confirm_logged_in
  before_action :logged_in_admin
  before_action :set_admin, only: [:show, :edit, :update]
  before_action :correct_admin

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: "Admin #{@admin.name} was successfully created." }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: "Admin #{@admin.name} successfully updated." }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.require(:admin).permit(:name, :email, :password)
  end

  def correct_admin
      if session[:position] == ['Admin'] && session[:admin_id] != @admin.id
        flash[:notice] = "Access denied!"
        redirect_to admin_path(session[:admin_id])
      end
  end

  def logged_in_admin
    if session[:position] != ['Admin']
       @developer = Developer.find(session[:developer_id]) unless session[:developer_id] == nil
       flash[:notice] = "Only access by Admin!"
       redirect_to developer_path(@developer)
    end
  end
end
