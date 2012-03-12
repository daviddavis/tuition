class Payment < ActiveRecord::Base
  belongs_to :student, counter_cache: true

  after_save lambda { student.update_balance_due if student.present?  }
  after_destroy -> { student.update_balance_due if student.present?  }
end
