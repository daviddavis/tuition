class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.decimal :credits, :precision => 7, :scale => 1
      t.date :start_date
      t.date :end_at

      t.timestamps
    end
  end
end
