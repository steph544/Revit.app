class Customer < ApplicationRecord
    has_many :orders 
    has_many :users, through: :orders 
    has_many :products, through: :orders 
end
