class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new(:title => 'Story 1')
    @story_count = Story.count + 1
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to(:action => 'index')
    else
      @story_count = Story.count
      render('new')
    end
  end

  def edit
    @story = Story.find(params[:id])
    @story_count = Story.count
  end

  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(story_params)
      #insert flash notice
      redirect_to(:action => 'show', :id => @story.id)
    else
      @story_count = Story.count
      render('edit')
    end
  end

  def delete
    @story = Story.find(params[:id])
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    #insert flash notice
    redirect_to(:action => 'index')
  end

  private
  def story_params
    params.require(:story).permit(:title, :description, :point_value, :stage)
  end
end
