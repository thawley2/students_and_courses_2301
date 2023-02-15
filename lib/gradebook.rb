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

  def students_below(threshold)
    all_students = @courses.map { |course| course.students }.flatten
    all_students.select { |student| student.grade < threshold}
  end

  def all_student_grades
    student_grades = {}
    @courses.each do |course|
      course.students.each do |student|
        student_grades[student.name] = student.grade
      end
    end
    student_grades
  end
end
