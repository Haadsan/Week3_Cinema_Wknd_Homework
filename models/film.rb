# https://gist.github.com/futuresocks/e896f5d72059d6291d564aba6fd01207

require_relative('../db/sql_runner')


class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_f
  end

  # which customers are coming to see one film

  # film1
  # film2.customers

# FROM tickets INNER JOIN customers
#     ON tickets.customer_id = customers.id
#  WHERE tickets.film_id = 1;  ...here you will get the film_id

#  this will show which customer went to see film 1
# id | name | funds
# ----+------+-------
#  1 | Mike | 250.0
# (1 row)

  def customers()
    sql = "SELECT customers.*
    FROM tickets INNER JOIN customers
    ON tickets.customer_id = customers.id
    WHERE tickets.film_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    customers = customer_data.map{|customer| Customer.new(customer)}
    return customers
  end


  def save()
    sql = "INSERT INTO films
    (
      title,
      price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films
    SET
    (
      title, price
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@title, @price, @id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM films"
      film_data = SqlRunner.run(sql)
      result = films.map{|film| Film.new(film_data)}
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM films"
      values = []
      SqlRunner.run(sql, values)
    end

  end
