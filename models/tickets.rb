require_relative("../db/sql_runner")
require_relative("customers")
require_relative("films")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize( options )
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets
    (
      customer_id,
      film_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run( sql,values ).first
    @id = ticket['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    values = []
    visits = SqlRunner.run(sql, values)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end

  def customer()
    SqlRunner.run(sql, values)
      sql = '
      SELECT * FROM customers
      WHERE id = $1;'
      values = [@customer_id]
      result = SqlRunner.run(sql, values)
      return Customer.new(result[0])
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end

  def films()
    SqlRunner.run(sql, values)
      sql = '
      SELECT * FROM films
      WHERE film_id = $1;'
      values = [@film_id]
      result = SqlRunner.run(sql, values)
      return Films.new(result[0])
  end

  def delete()
    sql = 'DELETE FROM tickets WHERE id = $1;'
    SqlRunner.run(sql, [@id])
  end

end
