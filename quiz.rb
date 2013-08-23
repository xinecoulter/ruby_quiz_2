#  _______  _______  ___   _______  __
# |       ||       ||   | |       ||  |
# |_     _||    ___||   | |    ___||  |
#   |   |  |   | __ |   | |   |___ |  |
#   |   |  |   ||  ||   | |    ___||__|
#   |   |  |   |_| ||   | |   |     __
#   |___|  |_______||___| |___|    |__|

QUIZ_TOPICS = ["ruby", "rspec", "testing", "arrays", "objects"]

# create a quiz object

# We can add numbers to it
# quiz = Quiz.new
# quiz.add(5)
# quiz.add(3)

class Quiz
  # attr_accessor :num
  def initialize
    @num = []
    @others = []
  end

  def add(num)
    if (num.class == Fixnum)
      @num << num
    elsif (num.class == Array)
      num.each do |element|
        if (element.class == Fixnum)
          @num << element
        else
          @others << element
        end
      end
    else
      @others << num
    end
    return @num
  end

  def numbers
    return @num.to_s()
  end

  def trash
    return @others
  end

  def count(specified_num)
    occurence = 0
    @num.each do |element|
      if element == specified_num
        occurence += 1
      end
    end
    return occurence
  end

  def rotate(rotate_num)
    rotate_num.times do
      front = @num.shift
      @num << front
    end
    return @num
  end

  def count_evens
    number_of_evens = 0
    @num.each do |element|
      if element.even?
        number_of_evens += 1
      end
    end
    return number_of_evens
  end
end

# We can see the numbers we've added
# quiz.numbers => "[5, 3]"

# We can only add numbers
# quiz.add("7")
# quiz.numbers => "[5, 3]"

# Or arrays of numbers
# quiz.add([4, 2, true, 9])
# quiz.numbers => "[5, 3, 4, 3]"

# We can't access the array directly
# quiz.numbers.push(5)
# => undefined method `push'

# Trash returns anything we've tried to add that's not a number.
# quiz.trash => ["7", true]

# Returns the number of occurences of a specified number
# quiz.numbers => "[5, 3, 4, 3]"
# quiz.count(3) => 2

# Takes a specified length of an array starting from the left and moves it to
# the tail end
# quiz.numbers => "[5, 3, 9, 4, 3]"
# quiz.rotate(2)
# quiz.numbers => "[9, 4, 3, 5, 3]"

# Prints out the number of even numbers in the array.
# quiz.numbers => "[9, 4, 3, 5, 3]"
# quiz.count_events => 1