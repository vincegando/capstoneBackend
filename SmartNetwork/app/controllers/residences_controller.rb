class ResidencesController < ApplicationController
  protect_from_forgery

  def search
    input = params[:address]
    @results = Residence.find_by_address(input)
    render json: @results
  end

  def process_information
    residence = Residence.find_by_address(params[:residence]) || Residence.create!(address: params[:residence])
    router_mac_address_for_residence = residence.routers.*.mac_address
    if (routers = params[:routers]).present? && routers.is_a?(Array)
      routers.each do |router|
        unless router_mac_address_for_residence.include?(router[:mac_address])
          Router.create!(router.permit(router.keys).merge(residence: residence))
        end
      end
    end
    if h = params[:heatmap]
      heatmap = Heatmap.create!(channel: h[:channel], radio: h[:radio], residence: residence)
      if (heatmap_points = h[:heatmap_points]).present? && heatmap_points.is_a?(Array)
        heatmap_points.each do |heatmaps|
          HeatmapPoint.create!(heatmaps.permit(heatmaps.keys).merge(heatmap: heatmap))
        end
      end
    end

    render nothing: true, status: 200, content_type: 'application/json'
  end
end
