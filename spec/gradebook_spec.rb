require 'rspec'
require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe GradeBook do
  @gb = GradeBook.new("Thomas")
  @course1 = Course.new("Calculus", 2)
  @course2 = Course.new('Biology', 4)
  @student1 = Student.new({name: "Morgan", age: 21})
  @student2 = Student.new({name: "Jordan", age: 29})
  @student3 = Student.new({name: "Billy", age: 29})
  @student4 = Student.new({name: "Sam", age: 29})

  describe '#initialize' do
    it 'exists' do
      expect(@gb).to be_instance_of(GradeBook)
    end

    it 'starts with no courses' do
      expect(@gb.courses).to eq([])
    end
  end
end