class Payment < ActiveRecord::Base
  belongs_to :student, counter_cache: true
end
