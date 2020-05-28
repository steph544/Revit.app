class User < ApplicationRecord
    has_secure_password
    has_many :orders 
    has_many :customers, through: :orders 
    has_many :purchases, through: :orders
    has_many :products, through: :purchases 
    has_many :suppliers, through: :products 

    validates :first_name, :last_name, :email, :username, :password, presence: true 
    validates :username, uniqueness: true
    validates :password, length: {minimum: 3}
    validates :username, :password, format: { without: /\s/, message: "cannot have spaces" }
    
       def self.total_products
        Product.all.count
       end

       def self.least_selling_product
        User.all.min_by{|user| user.product}.name
       end

       def self.most_selling_product
         User.all.max_by {|user| user.products.count}.name
       end
    
     
        def self.total_number_sales_per_order 
        @order.products.each do |p| 
            p.name.count
        end 
           
        
      def self.total_amount_sales_per_order 
        total = 0 
        @order.products.each do |product|
        total += product.cost
        total
        end
       end 

      
       
   
end
