class Supplier < ApplicationRecord
    has_many :products 
    has_many :purchases, through: :products 

    validates :name, presence: true 
end
