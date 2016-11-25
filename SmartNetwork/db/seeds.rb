# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


residence1 = 
{
	"residence"=> {
		"address"=> "6745 Del Playa Dr., Goleta"
	}
}


router1 = 
{	
	"router"=> {
		"mac_address"=> "00:23:6A:C0:64:B0",
		"serial_number"=> "SR400ACA185-0000469",
		"router_model"=> "SR400AC",
		"name"=> "myRouter",
		"latitude"=> 34.409476,
		"longitude"=> -119.864563,
		"owner"=> "Jill Farnsworth",
		"residence_id"=> 1,
		"heatmap_id"=> 1
	}
}

heatmap1 = 
{
	"heatmap"=> {
		"channel"=> "1",
		"radio"=> "2",
		"residence_id"=> 1
	}
}

heatmap_point1 = 
{
	"heatmap_point"=> {
		"latitude"=> 34.409342,
		"longitude"=> -119.864567,
		"client_info"=> "20:C9:D0:BE:DE:EB",
		"upstream_bps"=> 42416746.454099,
		"downstream_bps"=> 42416746.454099,
		"jitter"=> 572726,
		"client_rssi"=> -67,
		"router_rssi"=> -67,
		"num_active_clients"=> 1,
		"client_tx_speed"=> 27000,
		"client_rx_speed"=> 27000,
		"client_tx_retries"=> 4582,
		"client_rx_retries"=> 2769,
		"heatmap_id"=> 1
	}
}

heatmap_point2 = 
{
	"heatmap_point"=> {
		"latitude"=> 34.409379,
		"longitude"=> -119.864549,
		"client_info"=> "20:C9:D0:BE:DE:EB",
		"upstream_bps"=> 30711607.518634,
		"downstream_bps"=> 30707652.978996,
		"jitter"=> 572728,
		"client_rssi"=> -58,
		"router_rssi"=> -58,
		"num_active_clients"=> 1,
		"client_tx_speed"=> 13000,
		"client_rx_speed"=> 27000,
		"client_tx_retries"=> 5365,
		"client_rx_retries"=> 3642,
		"heatmap_id"=> 1
	}
}

heatmap_point3 = {
	"heatmap_point"=> {
		"latitude"=> 34.409429,
		"longitude"=> -119.864556,
		"client_info"=> "20:C9:D0:BE:DE:EB",
		"upstream_bps"=> 121822845.478985,
		"downstream_bps"=> 119915196.190917,
		"jitter"=> 651635,
		"client_rssi"=> -52,
		"router_rssi"=> -52,
		"num_active_clients"=> 1,
		"client_tx_speed"=> 121500,
		"client_rx_speed"=> 300000,
		"client_tx_retries"=> 5391,
		"client_rx_retries"=> 3719,
		"heatmap_id"=> 1
	}
}

heatmap_point4 = {
	"heatmap_point"=> {
		"latitude"=> 34.409476,
		"longitude"=> -119.864542,
		"client_info"=> "20:C9:D0:BE:DE:EB",
		"upstream_bps"=> 167902774.522632,
		"downstream_bps"=> 167222914.068755,
		"jitter"=> 572726,
		"client_rssi"=> -30,
		"router_rssi"=> -30,
		"num_active_clients"=> 1,
		"client_tx_speed"=> 121500,
		"client_rx_speed"=> 450000,
		"client_tx_retries"=> 5402,
		"client_rx_retries"=> 3803,
		"heatmap_id"=> 1
	}
}

heatmap_point5 = {
	"heatmap_point"=> {
		"latitude"=> 34.409521,
		"longitude"=> -119.864552,
		"client_info"=> "20:C9:D0:BE:DE:EB",
		"upstream_bps"=> 136403380.310940,
		"downstream_bps"=> 135335453.927137,
		"jitter"=> 572726,
		"client_rssi"=> -48,
		"router_rssi"=> -48,
		"num_active_clients"=> 1,
		"client_tx_speed"=> 121500,
		"client_rx_speed"=> 243000,
		"client_tx_retries"=> 5816,
		"client_rx_retries"=> 4586,
		"heatmap_id"=> 1
	}
}

# creating the residence record
residence = Residence.new(residence1["residence"])
residence.save
# adding in a Router record and adding it to the Residence foreign key
router = residence.routers.create(router1["router"])
# creating a heatmap record and adding it to the residence foreign key
heatmap = residence.heatmaps.create(heatmap1["heatmap"])

# adding the router to the heatmap records foreign key
heatmap.routers.create(router1)

# add heatmap points to the heatmap 
heatmap.heatmap_points.create(heatmap_point1["heatmap_point"])
heatmap.heatmap_points.create(heatmap_point2["heatmap_point"])
heatmap.heatmap_points.create(heatmap_point3["heatmap_point"])
heatmap.heatmap_points.create(heatmap_point4["heatmap_point"])
heatmap.heatmap_points.create(heatmap_point5["heatmap_point"])



