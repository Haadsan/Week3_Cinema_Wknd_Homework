require_relative('models/ticket')
require_relative('models/customer')
require_relative('models/film' )
require('pry-byebug')



customer1 = Customer.new({'name' => 'Mike', 'funds' => 250.00})
customer1.save()
customer2 = Customer.new({'name' => 'Maria', 'funds' => 200.00})
customer2.save()
customer3 = Customer.new({'name' => 'Hadsan', 'funds' => 50.00})
customer3.save()
customer4 = Customer.new({'name' => 'Joe', 'funds' => 10.00})
customer4.save()

film1 = Film.new({'title' => 'Mile 22', 'price' => 10.00})
film1.save
film2 = Film.new({'title' => 'King of Thieves', 'price' => 9.00})
film2.save
film3 = Film.new({'title' => 'The Predator', 'price' => 11.00})
film3.save
film4 = Film.new({'title' => 'A Simple Favor ', 'price' => 12.00})
film4.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket2.save
ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket3.save
ticket4 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket4.save
ticket5 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
ticket5.save
ticket6 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film4.id})
ticket6.save
ticket7 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film4.id})
ticket7.save



binding.pry
nil
