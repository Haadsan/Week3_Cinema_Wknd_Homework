# https://gist.github.com/futuresocks/e896f5d72059d6291d564aba6fd01207
require_relative('../db/sql_runner')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i

  end

  def film
    sql = "SELECT *
    FROM films
    WHERE films.id = $1"
    values = [@film_id]
    film_data = SqlRunner.run(sql, values)
    films = film_data.map{|film| Film.new(film)}
    return film
  end

  # You need this to make the method on customer.rb work

# customer1

#   SELECT *
# FROM films
# WHERE films.id = 3;
#
# id |    title     | price
# ----+--------------+-------
#   3 | The Predator |  11.0

  def customer
    sql = "SELECT *
    FROM customers
    WHERE customers.id = $1"
    values = [@customer_id]
    customer_data = SqlRunner.run(sql, values)
   customers = customer_data.map{|customer| Customer.new(customer)}
    return customer
  end

#   SELECT *
# FROM customers
# WHERE customers.id = 3;

#   id |  name  | funds
# ----+--------+-------
#  3 | Hadsan |  50.0
# (1 row)

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
    RETURNING *"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets
    SET
    (
      customer_id, film_id
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@customer_id, @film_id,  @id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM tickets"
      ticket_data = SqlRunner.run(sql)
      result = tickets.map{|ticket| Ticket.new(ticket_data)}
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM tickets"
      SqlRunner.run(sql)
    end

end
