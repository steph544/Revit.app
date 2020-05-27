class Product < ApplicationRecord
    belongs_to :supplier, optional: true
    has_many :purchases
    has_many :orders, through: :purchases 
    has_many :customers, through: :orders 
    has_many :users, through: :orders  

    

    def product_profit
        self.retail_price - self.cost 
    end 
end
