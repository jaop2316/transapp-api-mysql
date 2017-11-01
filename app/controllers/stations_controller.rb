class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]
  before_action :prepare_route_list, only: [:new, :edit]
  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
    @stations.each do |station|
      @stations_routes_list = Stationsroute.select("nomRuta").joins(:route).joins(:station).where({station_id: station.id})
    end

  end

  # GET /stations/1
  # GET /stations/1.json
  def show
   @stations_routes_list = Stationsroute.select("nomRuta").joins(:route).joins(:station).where({station_id: @station.id})

  end

  # GET /stations/new
  def new
    @station = Station.new

    @all_routes = Route.all
    @stations_routes = @station.stationsroutes.build
  end

  # GET /stations/1/edit
  def edit
    @all_routes = Route.all
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)
    params[:routes][:ids].each do |route|
      if !route.empty?
        @station.stationsroutes.build(:route_id => route)
        #Station.attribute(:routes => "test")
      end
    end


    respond_to do |format|
      if @station.save
        format.html {redirect_to @station, notice: 'Station was successfully created.'}
        format.json {render :show, status: :created, location: @station}
      else
        format.html {render :new}
        format.json {render json: @station.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update

    params[:route][:id].each do |route|
      if !route.empty?
        @station.stationsroutes.build(:route_id => route)
      end
    end

    respond_to do |format|
      if @station.update(station_params)
        format.html {redirect_to @station, notice: 'Station was successfully updated.'}
        format.json {render :show, status: :ok, location: @station}
      else
        format.html {render :edit}
        format.json {render json: @station.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html {redirect_to stations_url, notice: 'Station was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_station
    @station = Station.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def station_params
    params.require(:station).permit(:codParada, :nomParada, :latParada, :lonParada, :route_id, :routes)
  end

  def prepare_route_list
    @routes = Route.all
  end


end
