class Classroom
  def initialize(label, students)
    @label = label
    @students = students
  end
  attr_accessor :label
  attr_reader :students

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
