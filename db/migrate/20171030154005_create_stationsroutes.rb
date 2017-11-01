class CreateStationsroutes < ActiveRecord::Migration[5.1]
  def change
    create_table :stationsroutes do |t|
      t.integer :route_id, :null => false
      t.integer :station_id, :null => false

      t.timestamps
    end
  end
end
