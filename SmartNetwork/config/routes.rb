Rails.application.routes.draw do
  scope :heatmaps do
    get 'heatmap_and_points' => 'heatmaps#get_heatmaps_and_points'
    get 'search' => 'heatmaps#search'
    get 'search_by_mac' => 'heatmaps#search_by_mac'
  end

  post '/process_residence_information' => 'residences#process_information'

end
