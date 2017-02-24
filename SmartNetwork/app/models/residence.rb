class Residence < ActiveRecord::Base
  fields do
    address :string
    account_number :string
    timestamps
  end

  has_many :routers
  has_many :heatmaps
end
