require_relative('../db/sql_runner')

class Ticket

  attr_reader :id, :customer_id, :screening_id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @screening_id = options['screening_id'].to_i
  end
