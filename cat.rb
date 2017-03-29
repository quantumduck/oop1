class Cat
  attr_accessor :name
  attr_reader :preferred_food

  def initialize (name, preferred_food, meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time.to_i
    if ((@meal_time < 0) || (@meal_time > 23))
      @meal_time = 12
    end
  end

  def eats_at
    if (@meal_time > 12)
      "#{@meal_time - 12}PM"
    elsif (@meal_time == 0)
      "12AM"
    else
      "#{@meal_time}AM"
    end
  end

  def meow
    food =
    case @preferred_food
    when :wet
      "wet cat food"
    when :dry
      "dry cat food"
    else
      @preferred_food.to_s
    end
    "My name is #{@name}, and I like to eat #{food} at #{self.eats_at}."
  end
end

mycat = Cat.new("Fluffy", :dry, 18)

othercat = Cat.new("Sylvester McFluffiousness III", :wet, 19)

puts mycat.meow
puts othercat.meow
