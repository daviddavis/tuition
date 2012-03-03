class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :student
      t.decimal :amount, :precision => 7, :scale => 2
      t.datetime :paid_at

      t.timestamps
    end
    add_index :payments, :student_id
  end
end
