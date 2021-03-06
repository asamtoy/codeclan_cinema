require("pry")

require_relative("../models/customers.rb")
require_relative("../models/films.rb")
require_relative("../models/tickets.rb")

customer1 = Customer.new( {"name" => "Andrew", "funds" => "19"})
customer2 = Customer.new( {"name" => "Alice", "funds" => "400"})

customer1.save
customer2.save

film1 = Film.new( {"title" => "Lord of the Flies", "price" => "10"})
film2 = Film.new( {"title" => "The Great Gatsby", "price" => "11"})
film3 = Film.new( {"title" => "The Sun Also Rises", "price" => "12"})
film4 = Film.new( {"title" => "Summer Sets in Somerset", "price" => "200"})

film1.save
film2.save
film3.save
film4.save

film4.delete

ticket1 = Ticket.new( { "customer_id" => "1", "film_id" => "8"})
ticket2 = Ticket.new( { "customer_id" => "2", "film_id" => "8"})

ticket1.save
ticket2.save

ticket2.delete

ticket3 = Ticket.new( { "customer_id" => "2", "film_id" => "4"})

binding.pry
nil
