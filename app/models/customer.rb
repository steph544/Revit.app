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
end

