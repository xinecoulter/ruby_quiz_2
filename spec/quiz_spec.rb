require_relative '../quiz'
#  __    __    _______  __    __
# |  |  |  |  /  _____||  |  |  |
# |  |  |  | |  |  __  |  |__|  |
# |  |  |  | |  | |_ | |   __   |
# |  `--'  | |  |__| | |  |  |  |
#  \______/   \______| |__|  |__|

describe "a quiz" do
  it "should be about Ruby and Testing in Rspec" do
    expect(QUIZ_TOPICS).to include("ruby")
    expect(QUIZ_TOPICS).to include("rspec")
    expect(QUIZ_TOPICS).to include("testing")
  end
end

# more in quiz.rb!
describe "add method" do
  it "should add numbers" do
    quiz = Quiz.new
    expect(quiz.add(5)).to eq([5])
    expect(quiz.add(3)).to eq([5, 3])
  end

  it "should add only numbers" do
    quiz = Quiz.new
    quiz.add(5)
    quiz.add(3)
    quiz.add("7")
    expect(quiz.numbers).to eq("[5, 3]")
  end

  it "should accept arrays of numbers" do
    quiz = Quiz.new
    quiz.add(5)
    quiz.add(3)
    quiz.add([4, 2, true, 9])
    expect(quiz.numbers).to eq("[5, 3, 4, 2, 9]")
  end

end

describe "numbers method" do
  it "should show all the numbers added" do
    quiz = Quiz.new
    quiz.add(5)
    quiz.add(3)
    expect(quiz.numbers).to eq("[5, 3]")
  end
end

describe "trash method" do
  it "should return anything that was not a number" do
    quiz = Quiz.new
    quiz.add(5)
    quiz.add(3)
    quiz.add("7")
    quiz.add([4, 2, true, 9])
    expect(quiz.trash).to eq(["7", true])
  end
end

describe "count method" do
  it "returns the number of occurences of a specified number" do
    quiz = Quiz.new
    quiz.add([5, 3, 4, 3])
    expect(quiz.count(3)).to eq(2)
  end
end

describe "rotate method" do
  it "takes a specified length of an array starting from the left and moves it to the tail end" do
    quiz = Quiz.new
    quiz.add([5, 3, 9, 4, 3])
    quiz.rotate(2)
    expect(quiz.numbers).to eq("[9, 4, 3, 5, 3]")
  end
end

describe "count_evens method" do
  it "prints out the number of even numbers in the array" do
    quiz = Quiz.new
    quiz.add([9, 4, 3, 5, 3])
    expect(quiz.count_evens).to eq(1)
  end
end