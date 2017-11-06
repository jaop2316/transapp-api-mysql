class Api::V1::ApiStationsController < ApplicationController

  # Test function API

  def stationsXroutes
    @stations = Station.all


    @result = Array.new

    @stations.each do |station|
      @stations_routes_list = Stationsroute.select("nomRuta").joins(:route).joins(:station).where({station_id: station.id})
      @result << {
          cod: station.id,
          nombre: station.nomParada,
          latitud:station.latParada,
          longitud:station.lonParada,
          rutas: @stations_routes_list,
      }
    end

    respond_to do |format|
      format.json { render json: @result }
    end

  end

end