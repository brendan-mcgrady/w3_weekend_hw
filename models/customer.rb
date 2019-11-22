require('PG')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @name = info['name']
    @funds = info['funds'].to_i()
  end

end
