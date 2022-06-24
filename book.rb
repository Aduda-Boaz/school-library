require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals, :person

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @person = nil
  end

  def add_rental(rental)
    @rentals << rental
  end
end
