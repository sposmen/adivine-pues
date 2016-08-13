require './lib/question'

require './lib/question_db'

class AdivinePues

  attr_accessor :questions

  def initialize
    @score=0
    @questions = []
    # Iterar sobre preguntas
    QUESTIONS.each { |q|
      question= Question.new(dialog: q[:dialog])
      question.right_answer = q[:answer]
      question.options = q[:options]
      question.hint = q[:hint]

      @questions.push question
    }
  end

  def get_pregunta (index)
    @questions[index].dialog
  end

  def get_options(index)
    @questions[index].options
  end

  def verify_answer(index, selected_movie)
    result = @questions[index].is_right_answer? selected_movie
    set_score result
    result
  end

  def set_score result
    @score += 1 if result
  end

  def get_final_score
    "Your result is #{@score}/#{@questions.length}"
  end
end
