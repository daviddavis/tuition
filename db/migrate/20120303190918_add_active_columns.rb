class AddActiveColumns < ActiveRecord::Migration
  def change
    add_column :students, :active, :boolean
    add_column :courses, :active, :boolean
  end
end
