require('PG')
require_relative('film')
require_relative('customer')

class Ticket

  attr_accessor :customer_id, :film_id
  attr_reader :id

  def initialize(info)
    @id = info['id'].to_i()
    @customer_id = info['customer_id'].to_i()
    @film_id = info['film_id'].to_i()
  end

end
