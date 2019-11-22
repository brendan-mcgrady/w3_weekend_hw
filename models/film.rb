require('PG')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @title = info['title']
    @price = info['price'].to_i()
  end

end
