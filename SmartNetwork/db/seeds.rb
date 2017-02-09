Residence.destroy_all
Router.destroy_all
Heatmap.destroy_all
HeatmapPoint.destroy_all

residence = Residence.create(
	address: "6745 Del Playa Dr., Goleta"
)

router = Router.create(
	mac_address: "00:23:6A:C0:64:B0",
	serial_number: "SR400ACA185-0000469",
	router_model: "SR400AC",
	name: "myRouter",
	latitude: 34.409476,
	longitude: -119.864563,
	owner: "Jill Farnsworth",
	residence_id: residence.id
)

heatmap = Heatmap.create(
	channel: "1",
	radio: "2",
	residence_id: residence.id
)

router.heatmaps << heatmap
heatmap.routers << router

HeatmapPoint.create(
	{
		latitude: 34.409342,
		longitude: -119.864567,
		client_info: "20:C9:D0:BE:DE:EB",
		upstream_bps: 42416746.454099,
		downstream_bps: 42416746.454099,
		jitter: 572726,
		client_rssi: -67,
		router_rssi: -67,
		num_active_clients: 1,
		client_tx_speed: 27000,
		client_rx_speed: 27000,
		client_tx_retries: 4582,
		client_rx_retries: 2769,
		heatmap_id: heatmap.id
	}
)

HeatmapPoint.create(
	{
		latitude: 34.409379,
		longitude: -119.864549,
		client_info: "20:C9:D0:BE:DE:EB",
		upstream_bps: 30711607.518634,
		downstream_bps: 30707652.978996,
		jitter: 572728,
		client_rssi: -58,
		router_rssi: -58,
		num_active_clients: 1,
		client_tx_speed: 13000,
		client_rx_speed: 27000,
		client_tx_retries: 5365,
		client_rx_retries: 3642,
		heatmap_id: heatmap.id
	}
)

HeatmapPoint.create(
	{
		latitude: 34.409429,
		longitude: -119.864556,
		client_info: "20:C9:D0:BE:DE:EB",
		upstream_bps: 121822845.478985,
		downstream_bps: 119915196.190917,
		jitter: 651635,
		client_rssi: -52,
		router_rssi: -52,
		num_active_clients: 1,
		client_tx_speed: 121500,
		client_rx_speed: 300000,
		client_tx_retries: 5391,
		client_rx_retries: 3719,
		heatmap_id: heatmap.id
	}
)

HeatmapPoint.create(
	{
		latitude: 34.409476,
		longitude: -119.864542,
		client_info: "20:C9:D0:BE:DE:EB",
		upstream_bps: 167902774.522632,
		downstream_bps: 167222914.068755,
		jitter: 572726,
		client_rssi: -30,
		router_rssi: -30,
		num_active_clients: 1,
		client_tx_speed: 121500,
		client_rx_speed: 450000,
		client_tx_retries: 5402,
		client_rx_retries: 3803,
		heatmap_id: heatmap.id
	}
)

HeatmapPoint.create(
	{
		latitude: 34.409521,
		longitude: -119.864552,
		client_info: "20:C9:D0:BE:DE:EB",
		upstream_bps: 136403380.310940,
		downstream_bps: 135335453.927137,
		jitter: 572726,
		client_rssi: -48,
		router_rssi: -48,
		num_active_clients: 1,
		client_tx_speed: 121500,
		client_rx_speed: 243000,
		client_tx_retries: 5816,
		client_rx_retries: 4586,
		heatmap_id: heatmap.id
	}
)