SmartNetwork

API for storing and retrieving heatmap data for SmartNetwork mobile app.

API Specification Doc


Index
1. Process residence information
Request
Response
2. Search heatmaps by residence name
Request
Response
3. Search heatmaps and points by id
Request
Response


Methods
1. Process residence information
Save residence, routers, heatmap, and heatmap points in the database.
Request
Method
URL            
POST
/process_residence_information/<save_heatmap_example.json>

Type
Params
Values
Example
URL_PARAM
save_heatmap_example.json
json
{
 "address": "2222 some street, Santa Barbara CA 93101",
 "routers": [
   {
     "mac_address": "0000:0000:0000:0000",
     "serial_number": "12345568",
     "router_model": "d4rf",
     "name": "name",
     "latitude": 10.2,
     "longitude": 3.6
   }
 ],
 "heatmap": {
   "channel": 8,
   "radio": 5,
   "zoom": 18.0,
   "heatmap_points": [
     {
       "latitude": "34.409476",
       "longitude": "-119.864542",
       "client_info": "20:C9:D0:BE:DE:EB",
       "upstream_bps": 167903000,
       "jitter": 572726,
       "downstream_bps": 167223000,
       "client_rssi": -30,
       "router_rssi": -30,
       "num_active_clients": 1,
       "client_tx_speed": 121500,
       "client_rx_speed": 450000,
       "client_tx_retries": 5402,
       "client_rx_retries": 3803,
       "retransmits": 40,
       "lost_percent": 10.0
     }
   ]
 }
}

Response
Status
Response
200
OK
2. Search heatmaps by residence name or account number
Get information on a heatmap given residence name
Request
Method
URL            
GET
heatmaps/search/

Type
Params
Values
string
address
Can be null
string
account_number
Can be null

Response
Status
Response
200
Response will be a json object containing the information of the heatmap
[
   {
      "id":1,
      "channel":"1",
      "radio":"2",
      "zoom":18.0,
      "created_at":"2017-02-10T00:28:49.592Z",
      "updated_at":"2017-02-10T00:28:49.592Z",
      "residence_id":1
   }
]


3. Search heatmaps and points by id
Get information on a heatmaps and heatmap points given residence name
Request
Method
URL            
GET
/heatmaps/heatmap_and_points



Type
Params
Values
number
id

Response
Status
Response
200
A json output containing containing heatmaps and heatmap points

Example response:-

{
   "heatmap":{
      "id":1,
      "channel":"1",
      "radio":"2",
      "zoom":18.0
      "created_at":"2017-02-10T00:28:49.592Z",
      "updated_at":"2017-02-10T00:28:49.592Z",
      "residence_id":1
   },
   "heatmap_points":[
      {
         "id":1,
         "latitude":"34.409342",
         "longitude":"-119.864567",
         "client_info":"20:C9:D0:BE:DE:EB",
         "upstream_bps":42416746.454099,
         "jitter":572726.0,
         "downstream_bps":42416746.454099,
         "client_rssi":-67.0,
         "router_rssi":-67.0,
         "num_active_clients":1,
         "client_tx_speed":27000.0,
         "client_rx_speed":27000.0,
         "client_tx_retries":4582,
         "client_rx_retries":2769,
         "created_at":"2017-02-10T00:28:49.768Z",
         "updated_at":"2017-02-10T00:28:49.768Z",
         "heatmap_id":1,
         "retransmits":null,
         "lost_percent":null
      }   ]
}





