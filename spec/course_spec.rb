require 'rspec'
require './lib/student'
require './lib/course'

RSpec.describe Course do

  before(:each) do
    @course = Course.new("Calculus", 2)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@course).to be_instance_of(Course)
    end

    it 'has a name' do
      expect(@course.name).to eq('Calculus')
    end

    it 'has a capacity' do
      expect(@course.capacity).to eq(2)
    end
  end

  describe '#students' do
    it 'starts with 0 students' do
      expect(@course.students).to eq([])
    end

    it 'starts off not full' do
      expect(@course.full?).to be false
    end

    it 'can enroll students' do
      @course.enroll(@student1)
      @course.enroll(@student2)

      expect(@course.students).to eq([@student1, @student2])
    end

    it 'becomes full when at capacity' do
      @course.enroll(@student1)
      @course.enroll(@student2)
      
      expect(@course.full?).to be true
    end

    it 'cannot enroll more students than capacity' do
      @course.enroll(@student1)
      @course.enroll(@student2)

      expect(@course.enroll(@student2)).to eq('No more students can enroll')
    end
  end

    
end