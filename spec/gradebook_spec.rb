require 'rspec'
require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe GradeBook do
  before(:each) do
    @gb = GradeBook.new("Thomas")

    @course1 = Course.new("Calculus", 2)
    @course2 = Course.new('Biology', 4)

    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
    @student3 = Student.new({name: "Billy", age: 29})
    @student4 = Student.new({name: "Sam", age: 29})

    @course1.enroll(@student1)
    @course1.enroll(@student2)
    @course2.enroll(@student3)
    @course2.enroll(@student4)

    @student1.log_score(55)
    @student1.log_score(60)
    @student2.log_score(80)
    @student2.log_score(70)
    @student3.log_score(95)
    @student3.log_score(88)
    @student4.log_score(49)
    @student4.log_score(65)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@gb).to be_instance_of(GradeBook)
    end

    it 'has an instructor' do
      expect(@gb.instructor).to eq('Thomas')
    end

    it 'starts with no courses' do
      expect(@gb.courses).to eq([])
    end
  end

  describe '#add_courses' do
    it 'can add courses to gradebook' do
      @gb.add_course(@course1)
      @gb.add_course(@course2)

      expect(@gb.courses).to eq([@course1, @course2])
    end

    it 'can list all students in courses' do
      @gb.add_course(@course1)
      @gb.add_course(@course2)

      expect(@gb.list_all_students).to eq({'Biology' => [@student3, @student4], 'Calculus' => [@student1, @student2]})
    end
  end

  it 'can list all students below a certain grade' do
    @gb.add_course(@course1)
    @gb.add_course(@course2)

    expect(@gb.students_below(60)).to eq([@student1, @student4])
  end

  it 'can list all grades by all students' do
    @gb.add_course(@course1)
    @gb.add_course(@course2)

    expect(@gb.all_student_grades).to eq({"Billy"=>91.5, "Jordan"=>75.0, "Morgan"=>57.5, "Sam"=>57.0})
  end
end