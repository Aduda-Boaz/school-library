require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(classroom, age, name = 'Unknown', parent_permission = true) # rubocop:disable Style/OptionalBooleanParameter
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hockey
    '¯\(ツ)/¯'
  end

  def change_classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.includes?(self)
  end
end
