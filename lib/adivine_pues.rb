require 'question'

class AdivinePues

  attr_accessor :question

  def initialize
    @question = Question.new(dialog: "Why so serious?")
    @question.right_answer = "Batman the dark knight"
    @question.options = [
      "Terminator",
      "Batman the dark knight",
      "Batman begins",
      "Batman forever"
    ]
  end

  def get_pregunta
    @question.dialog
  end

  def get_options
    @question.options
  end

  def verifyAnswer dialog, selected_movie
    @question.is_right_answer? selected_movie

  end
end
