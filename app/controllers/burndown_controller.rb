class BurndownController < ApplicationController
  def show
    
  	@totalTime = 0
  	@timeArray = []
	
	@stories = Story.all.select{|s| s.project_id == params[:id].to_i}
	@stories.each do |story|
		@totalTime = @totalTime + story.effort
	end

  	@fixTotalTime = @totalTime
	@timeArray << @fixTotalTime

	  @time1 = 0
		s = @stories.select{|st| st.stages == 'Analysis'}
		s.each do |st|
			@time1 = @time1 + st.effort
		end
	  @totalTime = @totalTime - @time1
		@timeArray << @totalTime

	  @time2 = 0
		s = @stories.select{|st| st.stages == 'Ready for Dev'}
	        s.each do |st|
	                @time2 = @time2 + st.effort
	        end
	  @totalTime = @totalTime - @time2
		@timeArray << @totalTime

	  @time3 = 0
		s = @stories.select{|st| st.stages == 'In Dev'}
	        s.each do |st|
	                @time3 = @time3 + st.effort
	        end
	  @totalTime = @totalTime - @time3
		@timeArray << @totalTime

	  @time4 = 0
		s = @stories.select{|st| st.stages == 'Dev Complete'}
	        s.each do |st|
	                @time4 = @time4 + st.effort
	        end
	  @totalTime = @totalTime - @time4
		@timeArray << @totalTime

	  @time5 = 0
		s = @stories.select{|st| st.stages == 'In Test'}
	        s.each do |st|
	                @time5 = @time5 + st.effort
	        end
	  @totalTime = @totalTime - @time5
		@timeArray << @totalTime 

	  @time6 = 0
		s = @stories.select{|st| st.stages == 'Completed'}
	        s.each do |st|
	                @time6 = @time6 + st.effort
	        end
	  @totalTime = @totalTime - @time6
	@timeArray << @totalTime
  end

end