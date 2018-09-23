require_relative('../db/sql_runner')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    # @screening_id = options['screening_id'].to_i
  end

  #
  def film
    sql = "SELECT *
    FROM films
    WHERE films.id = $1"
    values = [@film_id]
    film_data = SqlRunner.run(sql, values)
    film = Film.map_items(film_data).first
    return film
  end
  #
  def customer
    sql = "SELECT *
    FROM customers
    WHERE customers.id = $1"
    values = [@customer_id]
    customer_data = SqlRunner.run(sql, values)
    customer = Customer.map_items(customer_data).first
    return customer
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
        $1, $2,
      )
      WHERE id = $3"
      values = [@customer_id, @film_id, @id]
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
