class Order < ApplicationRecord
    has_many :purchases
    has_many :products, through: :purchases
    belongs_to :customer, optional: true
    belongs_to :user, optional: true
    
    def total 
        total=0 
        self.products.each do |product| total += product.retail_price end
        total 
    end 
   
end
