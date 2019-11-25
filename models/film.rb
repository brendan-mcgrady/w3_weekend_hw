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

  def self.all()
    sql = 'SELECT * FROM films;'
    film_info = SqlRunner.run(sql)
    return film_info.map{ |film| Film.new(film) }
  end

  # def self.delete_all()
  #   sql = 'SELECT * FROM films;'
  #   SqlRunner.run(sql)
  # end

end
