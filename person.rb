require_relative 'nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1...100)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @book = []
    @rentals = []
  end
  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission

  def can_use_services
    return true if is_of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  def add_rental(rental, book)
    book.rentals.push(rental) unless book.rentals.include?(rental)
    book.person = self
    @rentals.push(rental)
    @book.push(book)
  end

  private

  def is_of_age? # rubocop:disable Naming/PredicateName
    return true if @age >= 18

    false
  end
end
