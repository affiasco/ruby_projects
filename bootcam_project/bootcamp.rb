class Bootcamp

  def initialize (name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, k| hash[k] = [] }
  end

  #getters
  def name 
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  #instance methods
  def hire(new_teacher)
    @teachers << new_teacher
  end

  def enroll(new_student)
    if @students.length < @student_capacity
      @students << new_student
      return true
    end
    false 
  end

  def enrolled?(student_name)
    @students.include?(student_name)
  end

  def student_to_teacher_ratio 
    @students.length / @teachers.length
  end

  def add_grade(student_name, student_grade)
    if enrolled?(student_name)
      @grades[student_name] << student_grade
      return true
    end
    false
  end

  def num_grades(student_name)  
    @grades[student_name].length
  end

  def average_grade(student_name)
    return nil if !enrolled?(student_name) || num_grades(student_name) == 0
    @grades[student_name].sum / num_grades(student_name)
  end

  
end
