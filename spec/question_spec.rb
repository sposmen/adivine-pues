require './lib/question'

describe Question do

  it "should return true if answer is 'Batman the dark night' to the dialog 'Why so serious?' " do
    question = Question.new(dialog: "Why so serious?")
    question.right_answer = "Batman the dark night"
    question.options = [
      "Terminator",
      "Batman the dark night",
      "Batman begins",
      "Batman forever"
    ]
    result = question.is_right_answer? "Batman the dark night"
    expect(result).to eq(true)
  end

end