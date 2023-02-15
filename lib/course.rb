class Course
  attr_reader :name, :capacity, :students

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
    @full = false
  end

  def full?
    @students.length >= @capacity
  end

  def enroll(student)
    if full?
      'No more students can enroll'
    else @students << student
    end
  end
  
end
