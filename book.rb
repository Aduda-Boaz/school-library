require 'rental'

class Book
  attr_accessor :title, :author, :rentals, :person

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @person = nil
  end
end
