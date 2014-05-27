class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string  :name, :null => false
      t.string  :street
      t.string  :city
      t.string  :county
      t.string  :state
      t.string  :zipcode
      t.string  :site_id
      t.string  :website
      t.decimal :lon, :precision => 10, :scale => 6
      t.decimal :lat, :precision => 10, :scale => 6
      t.geometry  :location, :srid => 4326
      t.integer :inspections_count, :default => 0
      t.timestamps
    end
  end
end
