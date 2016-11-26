class HeatmapPointsController < ApplicationController
  before_action :set_heatmap_point, only: [:show, :edit, :update, :destroy]
  protect_from_forgery

  # GET /heatmap_points
  # GET /heatmap_points.json
  def index
    @heatmap_points = HeatmapPoint.all
  end

  # GET /heatmap_points/1
  # GET /heatmap_points/1.json
  def show
    @heatmap_point = HeatmapPoint.find(params[:id])
    render :json => @heatmap_point
  end

  # GET /heatmap_points/new
  def new
    @heatmap_point = HeatmapPoint.new
  end

  # GET /heatmap_points/1/edit
  def edit
  end

  # POST /heatmap_points
  # POST /heatmap_points.json
  def create
    @heatmap_point = HeatmapPoint.new(heatmap_point_params)

    respond_to do |format|
      if @heatmap_point.save
        format.html { redirect_to @heatmap_point, notice: 'Heatmap point was successfully created.' }
        format.json { render :show, status: :created, location: @heatmap_point }
      else
        format.html { render :new }
        format.json { render json: @heatmap_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heatmap_points/1
  # PATCH/PUT /heatmap_points/1.json
  def update
    respond_to do |format|
      if @heatmap_point.update(heatmap_point_params)
        format.html { redirect_to @heatmap_point, notice: 'Heatmap point was successfully updated.' }
        format.json { render :show, status: :ok, location: @heatmap_point }
      else
        format.html { render :edit }
        format.json { render json: @heatmap_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heatmap_points/1
  # DELETE /heatmap_points/1.json
  def destroy
    @heatmap_point.destroy
    respond_to do |format|
      format.html { redirect_to heatmap_points_url, notice: 'Heatmap point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heatmap_point
      @heatmap_point = HeatmapPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def heatmap_point_params
      params.require(:heatmap_point).permit(:latitude, :longitude, :client_info, :upstream_bps, :downstream_bps, :jitter, :client_rssi, :router_rssi, :num_active_clients, :client_tx_speed, :client_rx_speed, :client_tx_retries, :client_rx_retries)
    end
end
