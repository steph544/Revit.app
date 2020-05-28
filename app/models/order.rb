class Order < ApplicationRecord
    has_many :purchases
    has_many :products, through: :purchases
    has_many :suppliers, through: :products 
    belongs_to :customer, optional: true
    belongs_to :user, optional: true
    
    def total 
        self.products.each.sum do |product| product.retail_price end
    end 

    def self.orders_monthly_count 
        now = Date.today
        thirty_days_ago = (now - 30)
        self.all.select do |order| order.created_at > thirty_days_ago end.count
    end 

    def self.orders_monthly_revenue 
        now = Date.today
        thirty_days_ago = (now - 30)
        orders= self.all.select do |order| order.created_at > thirty_days_ago end
        orders.each.sum do |order| order.total end 
    end 

    def self.orders_monthly_profit
        now = Date.today
        thirty_days_ago = (now - 30)
        profit_total=0
        orders= self.all.select do |order| order.created_at > thirty_days_ago end
        orders.each do |order| 
            order.products.each.sum do |product| 
            profit_total += product.product_profit end 
            end  
        profit_total 
    end 
    
    def self.orders_year_to_date 
        d=Date.today 
        self.all.select do |order| order.created_at.year == d.year end 
    end 

    def self.orders_yearly_revenue
        d=Date.today 
        orders = self.all.select do |order| order.created_at.year == d.year end 
        orders.each.sum do |order| order.total end    
    end 

    def self.orders_yearly_profit 
        d=Date.today 
        orders = self.all.select do |order| order.created_at.year == d.year end 
        profit_total=0
        orders.each do |order| 
            order.products.each.sum do |product| 
            profit_total += product.product_profit end 
            end  
        profit_total 
    end 

    def self.total_orders 
        self.all.count 
    end 

    def self.average_total 
        self.all.each.sum do |order| order.total end / self.all.count
    end 
   
end
