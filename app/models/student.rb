class Student < ActiveRecord::Base
  has_one :address
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :payments

  scope :include_student_report_data,
    joins("LEFT JOIN enrollments ON enrollments.student_id = students.id
           LEFT JOIN courses ON enrollments.course_id = courses.id AND courses.active IS true
           LEFT JOIN addresses ON students.id = addresses.student_id").
    select("students.*, COUNT(courses.id) as course_count, SUM(courses.credits) AS course_credits,
           CONCAT(addresses.street, ', ', addresses.city, ', ', addresses.state) AS report_address").
    group("students.id")

  def calculated_balance_due
    credits * 521.90 - payments.sum(&:amount)
  end

  def update_balance_due
    update_attribute(:balance_due, calculated_balance_due)
  end

  def credits
    attributes.keys.include?("course_credits") ? read_attribute(:course_credits) : courses.sum(&:credits)
  end

  def course_count
    attributes.keys.include?("course_count") ? read_attribute(:course_count) : courses.length
  end

  def report_address
    attributes.keys.include?("report_address") ? read_attribute(:report_address) : address.to_s
  end
end
