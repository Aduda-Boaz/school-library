require_relative 'person'
require_relative 'classroom'

class Student < Person
  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.includes?(self)
  end

  attr_reader :classroom

  def play_hockey
    '¯\(ツ)/¯'
  end
end
