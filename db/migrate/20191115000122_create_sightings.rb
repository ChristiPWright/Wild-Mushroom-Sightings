class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.integer :mushroom_key
      t.datetime :date
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
