class Restaurant < ActiveRecord::Base
  has_many :inspections

  scope :without_inspections, where(inspections_count: 0)
end
