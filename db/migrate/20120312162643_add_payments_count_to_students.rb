class AddPaymentsCountToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :payments_count, :integer

    Student.reset_column_information
    Student.all.each do |student|
      Student.update_counters student.id, :payments_count => student.payments.count
    end
  end

  def self.down
    remove_column :students, :payments_count
  end
end
