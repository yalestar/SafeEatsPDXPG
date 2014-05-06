class Inspection < ActiveRecord::Base
    belongs_to :restaurant, counter_cache: true
    has_many :violations


end
