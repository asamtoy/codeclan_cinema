require("pry")

require_relative("../models/customers.rb")
require_relative("../models/films.rb")

customer1 = Customer.new( {"name" => "Andrew", "funds" => "19"})
customer2 = Customer.new( {"name" => "Alice", "funds" => "400"})

film1 = Film.new( {"name" => "Lord of the Flies", "price" => "10"})
film2 = Film.new( {"name" => "The Great Gatsby", "price" => "11"})
film3 = Film.new( {"name" => "The Sun Also Rises". "price" => "12"})

binding.pry
nil
