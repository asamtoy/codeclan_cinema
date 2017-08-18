require_relative("../db/sql_runner")

class Film
  def initialize( film )
    @id = film['id'].to_i
    @name = film['title']
    @price = film['price']
  end

  def Film.all
    sql = 'SELECT * FROM films;'
    results = SqlRunner.run(sql)
    films = []
    for result_hash in results do
      film_object = Film.new(result_hash)
      films.push(film_object)
    end

    return films
  end

  def save
    sql = '
      INSERT INTO films (
        title,
        price
      ) VALUES (
        $1, $2
      )
      RETURNING *;'
    returned_data = SqlRunner.run(sql, [@name, @price])
    returned_hash = returned_data[0]
    id = returned_hash['id']
    @id = id.to_i()
  end

  def update()
    db = PG.connect( { dbname: 'cinema', host: 'localhost' } )
    sql = '
      UPDATE customers SET (
        name,
        price
      ) = (
        $1, $2
      )
      WHERE id = $5;'
    values = [@name, @price]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM films WHERE id = $1;'
    SqlRunner.run(sql, [@id])
  end

end
