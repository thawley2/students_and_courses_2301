class Student
  attr_reader :name, :age, :scores
  def initialize(student_deets)
    @name = student_deets[:name]
    @age = student_deets[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    @scores.sum.fdiv(@scores.length)
  end
end
