require 'pry'

class HeatmapsController < ApplicationController
  before_action :set_heatmap, only: [:show, :edit, :update, :destroy]
  protect_from_forgery

  # GET /heatmaps
  # GET /heatmaps.json
  def index
    @heatmaps = Heatmap.all
  end

  # GET /heatmaps/1
  # GET /heatmaps/1.json
  def show
    @heatmap = Heatmap.find(params[:id])
    render :json => @heatmap
  end

  def search_by_mac

    @results = Array.new
    input = params[:mac_address]

    @results = search_by_mac_helper(input)

    respond_to do |format|
      format.json { render :json => @results }
    end

  end

  def search_by_mac_helper(mac_address)

    results = Array.new
    all_heatmaps = Router.find_by_mac_address(mac_address)

    unless all_heatmaps.nil?
      results = all_heatmaps.heatmaps
    end

    return results
  end

  # GET /heatmaps/new
  def new
    @heatmap = Heatmap.new
  end

  # GET /heatmaps/1/edit
  def edit
  end

  # POST /heatmaps
  # POST /heatmaps.json
  def create
    @heatmap = Heatmap.new(heatmap_params)

    respond_to do |format|
      if @heatmap.save
        format.html { redirect_to @heatmap, notice: 'Heatmap was successfully created.' }
        format.json { render :show, status: :created, location: @heatmap }
      else
        format.html { render :new }
        format.json { render json: @heatmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heatmaps/1
  # PATCH/PUT /heatmaps/1.json
  def update
    respond_to do |format|
      if @heatmap.update(heatmap_params)
        format.html { redirect_to @heatmap, notice: 'Heatmap was successfully updated.' }
        format.json { render :show, status: :ok, location: @heatmap }
      else
        format.html { render :edit }
        format.json { render json: @heatmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heatmaps/1
  # DELETE /heatmaps/1.json
  def destroy
    @heatmap.destroy
    respond_to do |format|
      format.html { redirect_to heatmaps_url, notice: 'Heatmap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def search_by_date(start_date, end_date)
  #   heatmaps = Array.new
  #   found = Heatmap.where("created_at >= ? AND created_at <= ?", start_date, end_date)
  #   unless found.nil?
  #     heatmaps = found
  #   end
  # end

  def search
    @result = Array.new
    # checks if residence_address is a parameter and if so, searches by that.
    if params.has_key?(:residence_address)
      @result = search_by_residence(params[:residence_address])
    end

    respond_to do |format|
      format.json { render :json => @result }
    end
  end

  def search_by_residence(residence_address)
    heatmaps = Array.new
    found_residence = Residence.find_by_address(residence_address)

    unless found_residence.nil?
      heatmaps = found_residence.heatmaps
    end

    return heatmaps
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heatmap
      @heatmap = Heatmap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def heatmap_params
      params.permit(:radio, :channel)
    end
  end
