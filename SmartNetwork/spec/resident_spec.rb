require "rails_helper"

RSpec.describe "home page", :type => :request do
  json_input = File.read(Rails.root.join('spec/sample_data/save_heatmap_example.json'))
  it "saves the heatmap information in the database" do
    params ={}
    post "/process_residence_information", json_input,  {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end
end


RSpec.describe "home page", :type => :request do
  it "searches for heatmaps by residence" do
    params ={}
    get "/heatmaps/search", residence_address: "6745 Del Playa Dr., Goleta"
    expect(response).to be_success
    expect(response).to have_http_status(200)
    puts response.body
    expect(response.body).to eq("[{\"id\":1,\"channel\":\"1\",\"radio\":\"2\",\"created_at\":\"2017-02-10T00:28:49.592Z\",\"updated_at\":\"2017-02-10T00:28:49.592Z\",\"residence_id\":1}]")
  end
end

RSpec.describe "home page", :type => :request do
  it "retrieves the heatmap and points by id" do
    params ={}
    get "/heatmaps/heatmap_and_points", id: "1"
    expect(response).to be_success
    expect(response).to have_http_status(200)
    puts response.body
    expect(response.body).to eq("{\n\t\"heatmap\": {\"id\":1,\"channel\":\"1\",\"radio\":\"2\",\"created_at\":\"2017-02-10T00:28:49.592Z\",\"updated_at\":\"2017-02-10T00:28:49.592Z\",\"residence_id\":1},\n\t\"heatmap_points\": [{\"id\":1,\"latitude\":\"34.409342\",\"longitude\":\"-119.864567\",\"client_info\":\"20:C9:D0:BE:DE:EB\",\"upstream_bps\":42416746.454099,\"jitter\":572726.0,\"downstream_bps\":42416746.454099,\"client_rssi\":-67.0,\"router_rssi\":-67.0,\"num_active_clients\":1,\"client_tx_speed\":27000.0,\"client_rx_speed\":27000.0,\"client_tx_retries\":4582,\"client_rx_retries\":2769,\"created_at\":\"2017-02-10T00:28:49.768Z\",\"updated_at\":\"2017-02-10T00:28:49.768Z\",\"heatmap_id\":1,\"retransmits\":null,\"lost_percent\":null},{\"id\":2,\"latitude\":\"34.409379\",\"longitude\":\"-119.864549\",\"client_info\":\"20:C9:D0:BE:DE:EB\",\"upstream_bps\":30711607.518634,\"jitter\":572728.0,\"downstream_bps\":30707652.978996,\"client_rssi\":-58.0,\"router_rssi\":-58.0,\"num_active_clients\":1,\"client_tx_speed\":13000.0,\"client_rx_speed\":27000.0,\"client_tx_retries\":5365,\"client_rx_retries\":3642,\"created_at\":\"2017-02-10T00:28:49.796Z\",\"updated_at\":\"2017-02-10T00:28:49.796Z\",\"heatmap_id\":1,\"retransmits\":null,\"lost_percent\":null},{\"id\":3,\"latitude\":\"34.409429\",\"longitude\":\"-119.864556\",\"client_info\":\"20:C9:D0:BE:DE:EB\",\"upstream_bps\":121822845.478985,\"jitter\":651635.0,\"downstream_bps\":119915196.190917,\"client_rssi\":-52.0,\"router_rssi\":-52.0,\"num_active_clients\":1,\"client_tx_speed\":121500.0,\"client_rx_speed\":300000.0,\"client_tx_retries\":5391,\"client_rx_retries\":3719,\"created_at\":\"2017-02-10T00:28:49.821Z\",\"updated_at\":\"2017-02-10T00:28:49.821Z\",\"heatmap_id\":1,\"retransmits\":null,\"lost_percent\":null},{\"id\":4,\"latitude\":\"34.409476\",\"longitude\":\"-119.864542\",\"client_info\":\"20:C9:D0:BE:DE:EB\",\"upstream_bps\":167902774.522632,\"jitter\":572726.0,\"downstream_bps\":167222914.068755,\"client_rssi\":-30.0,\"router_rssi\":-30.0,\"num_active_clients\":1,\"client_tx_speed\":121500.0,\"client_rx_speed\":450000.0,\"client_tx_retries\":5402,\"client_rx_retries\":3803,\"created_at\":\"2017-02-10T00:28:49.850Z\",\"updated_at\":\"2017-02-10T00:28:49.850Z\",\"heatmap_id\":1,\"retransmits\":null,\"lost_percent\":null},{\"id\":5,\"latitude\":\"34.409521\",\"longitude\":\"-119.864552\",\"client_info\":\"20:C9:D0:BE:DE:EB\",\"upstream_bps\":136403380.31094,\"jitter\":572726.0,\"downstream_bps\":135335453.927137,\"client_rssi\":-48.0,\"router_rssi\":-48.0,\"num_active_clients\":1,\"client_tx_speed\":121500.0,\"client_rx_speed\":243000.0,\"client_tx_retries\":5816,\"client_rx_retries\":4586,\"created_at\":\"2017-02-10T00:28:49.882Z\",\"updated_at\":\"2017-02-10T00:28:49.882Z\",\"heatmap_id\":1,\"retransmits\":null,\"lost_percent\":null}]\n}\n")
  end
end



