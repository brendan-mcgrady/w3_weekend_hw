require('pry-byebug')
require_relative('models/film')
require_relative('models/customer')
require_relative('models/ticket')

customer1 = Customer.new({
  'name' => 'Brendan',
  'funds' => 33
  })
customer1.save()

customer2 = Customer.new({
  'name' => 'Emma',
  'funds' => 30
  })
customer2.save()

customer3 = Customer.new({
  'name' => 'Debbie',
  'funds' => 24
  })
customer3.save()

customer4 = Customer.new({
  'name' => 'Andrew',
  'funds' => 37
  })
customer4.save()

film1 = Film.new({
  'title' => 'Lord of Ruby: The Fellowship of the Clan',
  'price' => 14
  })

film2 = Film.new({
  'title' => 'SQL Wars: The Injection Strikes Back',
  'price' => 20
  })

film3 = Film.new({
  'title' => 'Bash or Die',
  'price' => 17
  })

film4 = Film.new({
  'title' => 'User Experience and Prejudice',
  'price' => 12
  })

ticket1 = Ticket.new({
  'customer_id' => customer1.id(),
  'film_id' => film4.id()
  })

ticket2 = Ticket.new({
  'customer_id' => customer2.id(),
  'film_id' => film1.id()
  })

ticket3 = Ticket.new({
  'customer_id' => customer3.id(),
  'film_id' => film3.id()
  })

ticket4 = Ticket.new({
  'customer_id' => customer4.id(),
  'film_id' => film2.id()
  })

binding.pry
nil
