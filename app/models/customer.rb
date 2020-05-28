class Customer < ApplicationRecord
    has_many :orders 
    has_many :users, through: :orders 
    has_many :purchases, through: :orders 
    has_many :products, through: :purchases 

    validates :first_name, presence:true 
    validates :last_name, presence:true 
    validates :email, presence:true 

    def full_name 
        "#{self.first_name} #{self.last_name}"
    end 

    def self.monthly_customers
        now = Date.today
        thirty_days_ago = (now - 30)
        self.all.select do |customer| customer.created_at > thirty_days_ago end.count
    end 

    def self.average_purchase
        if !self.all.empty?
            total= 0
            self.all.each.sum do |customer| customer.orders.each do |order| total += order.total end end 
            total/ self.all.each do |customer| customer.orders end.count 
        else
            puts "0" 
        end 
    end 
end

