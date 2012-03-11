class Student < ActiveRecord::Base
  has_one :address
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :payments

  def credits
    courses.sum(&:credits)
  end

  def calculated_balance_due
    credits * 521.90 - payments.sum(&:amount)
  end

  def update_balance_due
    update_attribute(:balance_due, calculated_balance_due)
  end
end
