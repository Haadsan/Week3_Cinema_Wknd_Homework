require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :title, :price, :empty_seats

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_f
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
      return Film.map_items(film_data)
    end


  end
