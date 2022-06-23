require_relative 'rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @person = nil
  end

  attr_accessor :title, :author, :rentals, :person
end
