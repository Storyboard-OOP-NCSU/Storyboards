class StoriesController < ApplicationController
  before_action :confirm_logged_in
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  
  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all if params[:search] == nil
    @stories = Story.find_by_sql("SELECT * FROM stories WHERE 
      title LIKE '%#{params[:search]}%' 
      OR description LIKE '%#{params[:search]}%' ") unless params[:search] == nil
  end

  

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
      	format.html { redirect_to @story.project, notice: 'Story was Completed.' }
      	format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
      	format.html { redirect_to @story.project, notice: 'Story was Completed.' }
      	format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
  	project = @story.project
    @story.destroy
    respond_to do |format|
      format.html { redirect_to project, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:project_id, :title, :description, :point, :stages)
    end
end
