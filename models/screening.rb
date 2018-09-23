require_relative('../db/sql_runner')

class Screening

  attr_reader :id
  attr_accessor :film_id, :start_time, :empty_seats

  def initialize(options)
    @id = options['id'].to_i
    @film_id = options['film_id'].to_i
    @start_time = options['start_time']
    @empty_seats = options['empty_seats'].to_i
  end
