# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all 
User.destroy_all 
Order.destroy_all 
Product.destroy_all 
Supplier.destroy_all 

c1=Customer.create(first_name: "Owen", last_name:"Cheney", email:"syang723@yahoo.com", address: "example", city: "Fulshear", state: "TX", phone: "713-418-9253", url: "Owen.jpg")
c2=Customer.create(first_name: "Stephanie", last_name:"Cheney", email:"syang723@yahoo.com", address: "example", city: "Fulshear", state: "TX", phone: "713-418-9253", url: "Owen.jpg")
c3=Customer.create(first_name: "Mark", last_name:"Cheney", email:"syang723@yahoo.com", address: "example", city: "Fulshear", state: "TX", phone: "713-418-9253", url: "Owen.jpg")
c4=Customer.create(first_name: "Elijah", last_name:"Cheney", email:"syang723@yahoo.com", address: "example", city: "Fulshear", state: "TX", phone: "713-418-9253", url: "Owen.jpg")


u1=User.create!(first_name:"Stephanie", last_name:"Cheney", email:"syang723@yahoo.com", phone:"713-418-9253", username: "yaya1", password: "1234")
u2=User.create(first_name:"Mark", last_name:"Cheney", email:"syang723@yahoo.com", phone:"713-418-9253", username: "yaya2", password: "12345")
u3=User.create(first_name:"Elijah", last_name:"Cheney", email:"syang723@yahoo.com", phone:"713-418-9253", username: "yaya3", password: "123456")

s1= Supplier.create(name:"Walmart", address:"", phone:"")
s2= Supplier.create(name:"Target", address:"", phone:"")
s3= Supplier.create(name:"HEB", address:"", phone:"")

p1= Product.create(name:"Product1", cost:25, retail_price:50, url: "", supplier_id: s1.id)
p2= Product.create(name:"Product1", cost:25, retail_price:50, url: "", supplier_id: s2.id)
p3= Product.create(name:"Product1", cost:25, retail_price:50, url: "", supplier_id: s3.id)
p4= Product.create(name:"Product1", cost:25, retail_price:50, url: "", supplier_id: s2.id)

o1=Order.create(user_id: u1.id, customer_id:c1.id, paid: 0, duedate:"March 30", product_id: p2.id)
o2=Order.create(user_id: u2.id, customer_id:c2.id, paid: 1, duedate:"March 30", product_id: p3.id)
o3=Order.create(user_id: u3.id, customer_id:c1.id, paid: 1, duedate:"March 30", product_id: p1.id)
o4=Order.create(user_id: u1.id, customer_id:c1.id, paid: 0, duedate:"March 30", product_id: p4.id)




#byebug 
0