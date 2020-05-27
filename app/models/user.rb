class User < ApplicationRecord
    has_secure_password
    has_many :orders 
    has_many :customers, through: :orders 
    has_many :purchases, through: :orders
    has_many :products, through: :purchases 
    has_many :suppliers, through: :products 

    validates :first_name, :last_name, :email, :username, :password, presence: true 
    validates :username, uniqueness: true
    validates :password, length: {minimum: 3}
    validates :username, :password, format: { without: /\s/, message: "cannot have spaces" }
    

   def self.total_number_sales_per_order 
    Product.all.count
   end

    def self.total_amount_sales_per_order
        @product.orders.each do |order|
            order.
    end
  
    def self.cost_of_good_sold 
    end
    
    def self.profit
    end
   
end
