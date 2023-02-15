class GradeBook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    students_by_course = {}
    @courses.each do |course|
      students_by_course[course.name] = course.students
    end
    students_by_course
  end
end
