class Course < ActiveRecord::Base
  belongs_to :student

  after_save -> { student.update_balance_due if student.present? }
  after_destroy -> { student.update_balance_due if student.present? }
end
