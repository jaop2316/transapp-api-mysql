class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :codRuta
      t.string :nomRuta
      t.integer :numBuses
      t.string :observRuta

      t.timestamps
    end
  end
end
