class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :student
      t.string :street
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
    add_index :addresses, :student_id
  end
end
