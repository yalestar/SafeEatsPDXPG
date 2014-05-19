class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.integer :internal_id
      t.string :inspection_type
      t.integer :restaurant_id, :null => false
      t.date :inspection_date
      t.decimal :score, :precision => 8, :scale => 2
      t.text :notes
      t.text :url
      t.integer :violations_count, :default => 0
      t.timestamps
    end
  end
end
