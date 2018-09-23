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


  def save()
    sql = "INSERT INTO screenings
    (
      film_id, start_time, empty_seats
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@film_id, @start_time, @empty_seats]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def update()
    sql = "UPDATE screenings
    SET
    (
      film_id, start_time, empty_seats
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@film_id, @start_time, @empty_seats, @id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM screenings"
      screening_data = SqlRunner.run(sql)
      return Screening.map_items(screening_data)
    end

  end
