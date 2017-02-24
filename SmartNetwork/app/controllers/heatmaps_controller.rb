require 'pry'
require 'json'

class HeatmapsController < ApplicationController
  protect_from_forgery

  def get_heatmaps_and_points
    @heatmap = Heatmap.find(params[:id])
    @heatmap_points = @heatmap.heatmap_points

    render file: 'heatmaps/heatmap_points_for_heatmap.json.erb', content_type: 'application/json'
  end

  def search_by_mac
    render json: search_by_mac_helper(params[:mac_address])
  end

  def search
    heatmaps = fetch_heatmaps_given_params!

    render json: merge_heatmaps(heatmaps)
  end

  private

  def search_by_mac_helper(mac_address)
    Router.find_by_mac_address(mac_address)._?.heatmaps || []
  end

  def merge_heatmaps(heatmaps)
    merged_heatmaps = []
    heatmaps.each do |heatmap_list|
      heatmap_list.each do |heatmap|
        merged_heatmaps << heatmap
      end
    end

    merged_heatmaps
  end

  def fetch_heatmaps_given_params!
    selection_hash = params.extract!(:address, :account_number).permit(:address, :account_number)

    Residence.where(selection_hash)._?.*.heatmaps
  end
end
