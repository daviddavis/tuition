class Student < ActiveRecord::Base
  has_one :address
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :payments

  def credits
    courses.sum(&:credits)
  end

  def balance_due
    credits * 521.90 - payments.sum(&:amount)
  end
end
