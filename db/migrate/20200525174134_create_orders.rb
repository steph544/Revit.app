class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id 
      t.integer :customer_id 
      t.string :paid, :default => "no"
      t.string :duedate 
      t.timestamps
    end
  end
end
