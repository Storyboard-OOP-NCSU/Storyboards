class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    story = Story.find(params[:story_id])
    if LineItem.story_line_item_less2?(story)
      @developer = Developer.find(params[:developer_id])
      if @developer.line_item.present?
          @developer.line_item.delete
      end
    	@line_item = story.line_items.build(:developer => @developer)

    	respond_to do |format|
      	if @line_item.save
        	format.html { redirect_to @line_item.story.project, notice: 'You successfully signed in one story.' }
        	format.json { render :show, status: :created, location: @line_item }
      	else
       		format.html { render @line_item.story.project }
        	# format.json { render json: @line_item.story.project, status: :unprocessable_entity }
      	end
    	end
    else
    	respond_to do |format|
    		format.html { redirect_to story.project , notice: 'Other 2 developers already signed in this story!   You can replace one in Show page.'}
      	# format.json { render json: story.project, notice: '2 other developers already sign' }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
  	story = @line_item.story
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to story, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:story_id, :developer_id)
    end
end
