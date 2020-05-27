class Order < ApplicationRecord
    has_many :purchases
    has_many :products, through: :purchases
    belongs_to :customer, optional: true
    belongs_to :user, optional: true
    
 
   
end
