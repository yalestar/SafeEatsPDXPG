class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.integer :restaurant_id, :null => false
      t.date :inspection_date
      t.decimal :score, :precision => 8, :scale => 2
      t.string :url
      t.timestamps
    end
  end
end
