class Product < ApplicationRecord
    belongs_to :supplier 
    has_many :orders 
    has_many :customers, through: :orders 
    has_many :users, through: :orders  
end
