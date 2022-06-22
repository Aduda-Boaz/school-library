class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...100)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :name, :age

  def can_use_services
    return true if is_of_age? || @parent_permission

    false
  end

  private

  def is_of_age? # rubocop:disable Naming/PredicateName
    return true if @age >= 18

    false
  end
end
