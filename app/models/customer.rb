class Customer < ApplicationRecord
    has_many :orders 
    has_many :users, through: :orders 
    has_many :purchases, through: :orders 

    validates :first_name, presence:true 
    validates :last_name, presence:true 
    validates :email, presence:true 
end
