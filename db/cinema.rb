require("pry")

require_relative("../models/customers.rb")
require_relative("../models/films.rb")

customer1 = Customer.new( {"name" => "Andrew", "funds" => "19"})
customer2 = Customer.new( {"name" => "Alice", "funds" => "400"})

binding.pry
nil
