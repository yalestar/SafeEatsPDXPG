class CreateViolations < ActiveRecord::Migration
  def change
    create_table  :violations do |t|
      t.integer   :inspection_id
      t.text      :violation_text
      t.text      :rule
      t.text      :violation_comments
      t.text      :corrective_text
      t.text      :corrective_comments
      t.decimal   :point_deduction, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
