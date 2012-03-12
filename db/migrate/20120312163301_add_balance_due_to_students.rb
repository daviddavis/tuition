class AddBalanceDueToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :balance_due, :decimal, precision: 15, scale: 2

    Student.all.each(&:update_balance_due)
  end

  def self.down
    remove_column :students, :balance_due
  end
end
