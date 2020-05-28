class Supplier < ApplicationRecord
    has_many :products 
    has_many :purchases, through: :products 
    has_many :orders, through: :purchases 
    has_many :customers, through: :orders 

    validates :name, presence: true 


    def total_orders 
        self.orders.count 
    end 

    def number_customers 
        self.customers.count 
    end 

    def products_sold_count 
        self.products.count 
    end 

    def self.total_suppliers 
        self.count 
    end 

end
