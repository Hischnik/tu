class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: %i[ show edit update destroy ]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to railway_station_url(@railway_station), notice: "Станция успешно создана." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to railway_station_url(@railway_station), notice: "Станция успешно изменена." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @railway_station.destroy

    respond_to do |format|
      format.html { redirect_to railway_stations_url, notice: "Станция успешно удалена." }
    end
  end

  private

    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
