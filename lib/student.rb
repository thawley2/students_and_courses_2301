class Student
  attr_reader :name, :age
  def initialize(student_deets)
    @name = student_deets[:name]
    @age = student_deets[:age]
  end
end
