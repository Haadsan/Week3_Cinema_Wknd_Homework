require_relative('../db/sql_runner')

class Ticket

  attr_reader :id, :customer_id, :screening_id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @screening_id = options['screening_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets
    (
      customer_id,
      screening_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@customer_id, @screening_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets
    SET
    (
      customer_id, screening_id
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@customer_id, @screening_id, @id]
    SqlRunner.run(sql, values)
  end

  
