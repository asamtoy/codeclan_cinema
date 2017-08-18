require_relative("../db/sql_runner")

class Customer
  def initialize( customer )
    @id = customer['id'].to_i
    @name = customer['name']
    @funds = customer['funds'].to_i
  end

  def Customer.all
    sql = 'SELECT * FROM customers;'
    results = SqlRunner.run(sql)
    customers = []
    for result_hash in results do
      customer_object = Customer.new(result_hash)
      customers.push(customer_object)
    end

    return customers
  end

  def save
    sql = '
      INSERT INTO customers (
        name,
        funds
      ) VALUES (
        $1, $2
      )
      RETURNING *;'
    returned_data = SqlRunner.run(sql, [@name, @funds])
    returned_hash = returned_data[0]
    id = returned_hash['id']
    @id = id.to_i()
  end

  def update()
    sql = '
      UPDATE customers SET (
        name,
        funds
      ) = (
        $1, $2
      )
      WHERE id = $3;'
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM customers WHERE id = $1;'
    SqlRunner.run(sql, [@id])
  end

end
