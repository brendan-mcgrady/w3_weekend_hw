require_relative('../db/sqlrunner')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @name = info['name']
    @funds = info['funds'].to_i()
  end

  def save()
    sql = 'INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;'
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first()
    @id = customer['id'].to_i()
  end

  def self.all()
    sql = 'SELECT * FROM customers;'
    customer_info = SqlRunner.run(sql)
    return customer_info.map{ |customer| Customer.new(customer) }
  end

  def update()
    sql = 'UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3;'
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end


  def films()
    sql = 'SELECT films.* FROM films INNER JOIN tickets ON
           tickets.film_id WHERE customer_id = $1;'
    values = [@id]
    film_info = SqlRunner.run(sql, values)
    return film_info.map{ |film| Film.new(film) }
  end

  # def self.delete_all()
  #   sql = 'DELETE * FROM customers;'
  #   SqlRunner.run(sql)
  # end

end
