json.extract! router, :id, :loc, :MAC, :name, :serial, :created_at, :updated_at
json.url router_url(router, format: :json)