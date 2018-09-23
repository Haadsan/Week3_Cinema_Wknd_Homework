require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :title, :price, :empty_seats

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_f
  end
