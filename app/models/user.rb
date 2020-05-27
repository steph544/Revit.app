class User < ApplicationRecord
    has_secure_password
    has_many :orders 
    has_many :customers, through: :orders 
    has_many :products, through: :orders

    validates :first_name, :last_name, :email, :username, :password, presence: true 
    validates :username, uniqueness: true
    validates :password, length: {minimum: 3}
    validates :username, :password, format: { without: /\s/, message: "cannot have spaces" }
    
  
end
