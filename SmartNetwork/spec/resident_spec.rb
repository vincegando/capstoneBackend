require "rails_helper"

RSpec.describe "home page", :type => :request do
  before do
    @json_input = File.read(Rails.root.join('spec/sample_data/save_heatmap_example.json'))
    @num_of_heatmaps_before = Heatmap.all.size
    @num_of_residences_before = Residence.all.size
    @num_of_routers_before = Router.all.size
    @num_of_heatmap_points_before = HeatmapPoint.all.size
  end
  it "saves the heatmap information in the database" do
    post "/process_residence_information", @json_input,  {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(Heatmap.all.size).to eq @num_of_heatmaps_before + 1
    expect(Residence.all.size).to eq @num_of_residences_before + 1
    expect(Router.all.size).to eq @num_of_routers_before + 2
    expect(HeatmapPoint.all.size).to eq @num_of_heatmap_points_before + 2
  end
end


RSpec.describe "home page", :type => :request do
  it "searches for heatmaps by address" do
    get "/heatmaps/search", address: "6745 Del Playa Dr., Goleta"
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response.body).to eq("[{\"id\":3,\"channel\":\"1\",\"radio\":\"2\",\"created_at\":\"2017-02-23T02:51:09.998Z\",\"updated_at\":\"2017-02-23T02:51:09.998Z\",\"residence_id\":3}]")
  end
end

RSpec.describe "home page", :type => :request do
  before do
    json_input = File.read(Rails.root.join('spec/sample_data/save_heatmap_example.json'))
    post "/process_residence_information", json_input,  {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
  end

  it "searches for heatmaps by account number" do
    # stores another residence, router, and heatmap with points
    get "/heatmaps/search", account_number: "1234567"
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body).size).to eq 2
  end
end

RSpec.describe "home page", :type => :request do
  it "retrieves the heatmap and points by id" do
    get "/heatmaps/heatmap_and_points", id: "3"
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response.body).to eq("{\n\t\"heatmap\": {\"id\":3,\"channel\":\"1\",\"radio\":\"2\",\"created_at\":\"2017-02-23T02:51:09.998Z\",\"updated_at\":\"2017-02-23T02:51:09.998Z\",\"residence_id\":3},\n\t\"heatmap_points\": [{\"id\":11,\"latitude\":\"34.409342\",\"longitude\":\"-119.864567\",\"client_info\":\"20:C9:D0:BE:DE:EB\",\"upstream_bps\":42416746.454099,\"jitter\":572726.0,\"downstream_bps\":42416746.454099,\"client_rssi\":-67.0,\"router_rssi\":-67.0,\"num_active_clients\":1,\"client_tx_speed\":27000.0,\"client_rx_speed\":27000.0,\"client_tx_retries\":4582,\"client_rx_retries\":2769,\"created_at\":\"2017-02-23T02:51:10.073Z\",\"updated_at\":\"2017-02-23T02:51:10.073Z\",\"heatmap_id\":3,\"retransmits\":null,\"lost_percent\":null},{\"id\":12,\"latitude\":\"34.409379\",\"longitude\":\"-119.864549\",\"client_info\":\"20:C9:D0:BE:DE:EB\",\"upstream_bps\":30711607.518634,\"jitter\":572728.0,\"downstream_bps\":30707652.978996,\"client_rssi\":-58.0,\"router_rssi\":-58.0,\"num_active_clients\":1,\"client_tx_speed\":13000.0,\"client_rx_speed\":27000.0,\"client_tx_retries\":5365,\"client_rx_retries\":3642,\"created_at\":\"2017-02-23T02:51:10.092Z\",\"updated_at\":\"2017-02-23T02:51:10.092Z\",\"heatmap_id\":3,\"retransmits\":null,\"lost_percent\":null},{\"id\":13,\"latitude\":\"34.409429\",\"longitude\":\"-119.864556\",\"client_info\":\"20:C9:D0:BE:DE:EB\",\"upstream_bps\":121822845.478985,\"jitter\":651635.0,\"downstream_bps\":119915196.190917,\"client_rssi\":-52.0,\"router_rssi\":-52.0,\"num_active_clients\":1,\"client_tx_speed\":121500.0,\"client_rx_speed\":300000.0,\"client_tx_retries\":5391,\"client_rx_retries\":3719,\"created_at\":\"2017-02-23T02:51:10.123Z\",\"updated_at\":\"2017-02-23T02:51:10.123Z\",\"heatmap_id\":3,\"retransmits\":null,\"lost_percent\":null},{\"id\":14,\"latitude\":\"34.409476\",\"longitude\":\"-119.864542\",\"client_info\":\"20:C9:D0:BE:DE:EB\",\"upstream_bps\":167902774.522632,\"jitter\":572726.0,\"downstream_bps\":167222914.068755,\"client_rssi\":-30.0,\"router_rssi\":-30.0,\"num_active_clients\":1,\"client_tx_speed\":121500.0,\"client_rx_speed\":450000.0,\"client_tx_retries\":5402,\"client_rx_retries\":3803,\"created_at\":\"2017-02-23T02:51:10.157Z\",\"updated_at\":\"2017-02-23T02:51:10.157Z\",\"heatmap_id\":3,\"retransmits\":null,\"lost_percent\":null},{\"id\":15,\"latitude\":\"34.409521\",\"longitude\":\"-119.864552\",\"client_info\":\"20:C9:D0:BE:DE:EB\",\"upstream_bps\":136403380.31094,\"jitter\":572726.0,\"downstream_bps\":135335453.927137,\"client_rssi\":-48.0,\"router_rssi\":-48.0,\"num_active_clients\":1,\"client_tx_speed\":121500.0,\"client_rx_speed\":243000.0,\"client_tx_retries\":5816,\"client_rx_retries\":4586,\"created_at\":\"2017-02-23T02:51:10.190Z\",\"updated_at\":\"2017-02-23T02:51:10.190Z\",\"heatmap_id\":3,\"retransmits\":null,\"lost_percent\":null}]\n}\n")
  end
end



