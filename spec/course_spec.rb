require 'rspec'
require './lib/student'
require './lib/course'

RSpec.describe Course do

  before(:each) do
    @course = Course.new("Calculus", 2)
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
end