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

end
