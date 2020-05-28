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

    def self.total 
        self.all.count 
    end 

    def self.monthly_sold 
        now = Date.today
        thirty_days_ago = (now - 30)
        orders= Order.all.select do |order| order.created_at > thirty_days_ago end
        orders.map.sum do |order| order.products.count end
    end 

    def self.yearly_sold 
        d=Date.today 
        orders= Order.all.select do |order| order.created_at.year == d.year end 
        orders.map.sum do |order| order.products.count end
    end 

    def self.average_retail_price 
        self.all.each.sum do |product| product.retail_price end/self.all.count 
    end 
end
