require_relative 'person'

class Teacher < Person
  attr_accessor :parent_permission

  def initialize(specialization, age, name = 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
