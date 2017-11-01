class Station < ApplicationRecord
  #belongs_to :route
  include ActiveModel::AttributeAssignment
  attr_accessor :routes

  has_many:stationsroutes
  has_many:route, :through => :stationsroutes

end

