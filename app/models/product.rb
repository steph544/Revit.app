class Product < ApplicationRecord
    belongs_to :supplier, optional: true
    has_many :purchases
    has_many :orders, through: :purchases 
    has_many :customers, through: :orders 
    has_many :users, through: :orders  

    validates :name, presence: true 
    validates :cost, presence: true 
    validates :retail_price, presence: true 

    

    def product_profit
        self.retail_price - self.cost 
    end 
end
