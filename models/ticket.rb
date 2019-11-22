require_relative('../db/sqlrunner')
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

  def save()
    sql = 'INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id;'
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first()
    @id = ticket['id'].to_i()
  end

end
