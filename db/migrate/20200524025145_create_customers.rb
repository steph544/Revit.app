class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name  
      t.string :email
      t.string :address 
      t.string :city 
      t.string :zip 
      t.string :state 
      t.string :phone 
      t.string :url
      t.timestamps
    end
  end
end
