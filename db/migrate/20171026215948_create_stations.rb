class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :codParada
      t.string :nomParada
      t.float :latParada
      t.float :lonParada
      t.references :route, foreign_key: true

      t.timestamps
    end
  end
end
