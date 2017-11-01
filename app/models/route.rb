class Route < ApplicationRecord
  has_many:stations
  belongs_to  :stationsroute
end
