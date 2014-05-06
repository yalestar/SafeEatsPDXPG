class Violation < ActiveRecord::Base
    belongs_to :inspection, counter_cache: true
    
end
