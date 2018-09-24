# https://gist.github.com/futuresocks/e896f5d72059d6291d564aba6fd01207

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


# screening1 = Screening.new({'film_id' => film1.id, 'start_time' => '2018-09-19 15:00:00', 'empty_seats' => 20})
# screening1.save
# screening2 = Screening.new({'film_id' => film2.id, 'start_time' => '2018-09-20 12:00:00', 'empty_seats' => 15})
# screening2.save
# screening3 = Screening.new({'film_id' => film3.id, 'start_time' => '2018-09-21 18:00:00', 'empty_seats' => 1})
# screening3.save
# screening4 = Screening.new({'film_id' => film4.id, 'start_time' => '2018-09-22 17:00:00', 'empty_seats' => 20})
# screening4.save
# screening5 = Screening.new({'film_id' => film4.id, 'start_time' => '2018-09-23 20:00:00', 'empty_seats' =
# screening5.save

binding.pry
nil
