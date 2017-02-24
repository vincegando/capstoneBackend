class ResidencesController < ApplicationController
  protect_from_forgery

  def process_information
    residence = Residence.find_by_address(params[:address]) || Residence.create!(address: params[:address], account_number: params[:account_number])
    router_mac_address_for_residence = residence.routers.*.mac_address
    if (routers = params[:routers]).present? && routers.is_a?(Array)
      created_routers = []
      routers.each do |router|
        unless router_mac_address_for_residence.include?(router[:mac_address])
          created_routers.push Router.create!(router.permit(router.keys).merge(residence: residence))
        end
      end
    end
    if h = params[:heatmap]
      heatmap = Heatmap.create!(channel: h[:channel], radio: h[:radio], residence: residence, routers: created_routers)
      if (heatmap_points = h[:heatmap_points]).present? && heatmap_points.is_a?(Array)
        heatmap_points.each do |heatmaps|
          HeatmapPoint.create!(heatmaps.permit(heatmaps.keys).merge(heatmap: heatmap))
        end
      end
    end

    render nothing: true, status: 200, content_type: 'application/json'
  end
end
