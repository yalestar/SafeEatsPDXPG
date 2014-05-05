class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations do |t|
      t.integer :inspection_id
      t.text :violation_text
      t.decimal :point_decution, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
