class AddActiveColumns < ActiveRecord::Migration
  def self.up
    add_column :students, :active, :boolean
    add_column :courses, :active, :boolean

    Course.all.each {|c| c.update_attribute(:active, true)}
  end

  def self.down
    remove_column :students, :active
    remove_column :course, :active
  end
end
