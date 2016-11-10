class HeatmapController < ApplicationController
	protect_from_forgery

	def get_heatmap_points
		render :json => params[:id]
	end

	def create	    
	    render :json => params[:id]
    end

end