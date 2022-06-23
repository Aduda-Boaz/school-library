require_relative 'student'

class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  attr_reader :students
  attr_accessor :label

  def add_student(student)
    student.classroom = self
    @students.push(student)
  end
end
