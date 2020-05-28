class Supplier < ApplicationRecord
    has_many :products 
    has_many :purchases, through: :products 
    has_many :orders, through: :purchases 
    has_many :customers, through: :orders 

    validates :name, presence: true 
end
