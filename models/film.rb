require_relative('../db/sqlrunner')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @title = info['title']
    @price = info['price'].to_i()
  end

  def save()
    sql = 'INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;'
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first()
    @id = film['id'].to_i()
  end

end
