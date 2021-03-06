class User < ApplicationRecord
    has_secure_password
    has_many :orders 
    has_many :customers, through: :orders 
    has_many :purchases, through: :orders
    has_many :products, through: :purchases 
    has_many :suppliers, through: :products 

    validates :first_name, :last_name, :email, :username, :password, presence: true 
    validates :username, uniqueness: true
    validates :password, length: {minimum: 8}
    validates :username, :password, format: { without: /\s/, message: "Cannot have spaces" }
    
end
