class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name 
      t.integer :cost 
      t.integer :retail_price 
      t.string :url
      t.integer :supplier_id
      t.timestamps
    end
  end
end
