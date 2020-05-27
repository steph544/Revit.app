class User < ApplicationRecord
    has_many :orders 
    has_many :customers, through: :orders 
    has_many :purchases, through: :orders
    has_many :products, through: :purchases 
    has_many :suppliers, through: :products 

    validates :first_name, presence: true 
    validates :last_name, presence: true 
    validates :email, presence: true 
end
