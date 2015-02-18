class DevelopersController < ApplicationController
  before_action :confirm_logged_in
  before_action :set_developer, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_developer, only: [:show, :edit, :update] 
  before_action :correct_developer, only: [:show, :edit, :update]
  before_action :admin_only, except: [:show, :edit, :update]
  
  # GET /developers
  # GET /developers.json
  def index
    @developers = Developer.all
  end

  # GET /developers/1
  # GET /developers/1.json
  def show
  end

  # GET /developers/new
  def new
    @developer = Developer.new
  end

  # GET /developers/1/edit
  def edit
  end

  # POST /developers
  # POST /developers.json
  def create
    @developer = Developer.new(developer_params)

    respond_to do |format|
      if @developer.save
        UserMailer.welcome_email(@developer).deliver
        format.html { redirect_to developers_path, notice: "Developer #{@developer.name} was successfully created." }
        format.json { render :show, status: :created, location: @developer }
      else
        format.html { render :new }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /developers/1
  # PATCH/PUT /developers/1.json
  def update
    respond_to do |format|
      if @developer.update(developer_params)
      	if session[:position] == ['Developer']
        	format.html { redirect_to @developer, notice: "Developer #{@developer.name} was successfully updated." }
        	format.json { render :show, status: :ok, location: @developer }
        end
        if session[:position] == ['Admin']
        	# change developer's project, his assigned story need to delete
        	if @developer.line_item.present?
          	@developer.line_item.delete
     		 	end
        	format.html { redirect_to developers_path, notice: "Developer #{@developer.name} was successfully updated." }
        	format.json { render :show, status: :ok, location: @developer }
        end
      else
        format.html { render :edit }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /developers/1
  # DELETE /developers/1.json
  def destroy
    @developer.destroy
    respond_to do |format|
      format.html { redirect_to developers_url, notice: "Developer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer
      @developer = Developer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def developer_params
      params.require(:developer).permit(:project_id, :name, :email, :password)
    end

    def logged_in_developer
      if session[:position] == ['Admin']
         flash[:notice] = "Access denied!"
         redirect_to developers_path
      end
    end

    #cannot view other developers' pages
    def correct_developer
      if session[:position] == ['Developer'] && session[:developer_id] != @developer.id
        flash[:notice] = "Access denied!"
        redirect_to developer_path(session[:developer_id])
      end
    end

    def admin_only
    if session[:position] != ['Admin']
       @developer = Developer.find(session[:developer_id]) unless session[:developer_id] == nil
       flash[:notice] = "Only access by Admin!"
       redirect_to developer_path(@developer)
    end
  end
  
end
