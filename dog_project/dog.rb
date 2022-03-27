class Dog

  def initialize (name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  #getters
  def name
    @name
  end

  def breed
    @breed
  end

  def age
    @age
  end

  def favorite_foods
    @favorite_foods
  end

  #setter
  def age=(age)
    @age = age
  end

  #instance methods

  def bark
    return @bark.upcase if @age > 3
    @bark.downcase
  end  

  def favorite_food?(string)
    @favorite_foods.map(&:downcase).include?(string.downcase)
  end

end
