require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_f
  end

# Show which films a customer has booked to see
  def films()
      sql = "SELECT films.*
      FROM films
      INNER JOIN tickets
      ON tickets.film_id = films.id
      WHERE tickets.customer_id = $1"
      values = [@id]
      film_data = SqlRunner.run(sql, values)
      return Film.map_items(film_data)
    end


  def save()
    sql = "INSERT INTO customers
    (
      name,
      funds
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end




  def update()
    sql = "UPDATE customers
    SET
    (
      name, funds
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@name, @funds, @id]
      SqlRunner.run(sql, values)
    end

    

    def self.all()
      sql = "SELECT * FROM customers"
      customer_data = SqlRunner.run(sql)
      result = customers.map{|customer| Customer.new(customer_data)}
      return result
    end

    def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  end
