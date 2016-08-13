require './lib/question'

require './lib/question_db'

class AdivinePues

  attr_accessor :question

  def initialize
    @score=0
    @question = []
    # Iterar sobre preguntas
    QUESTIONS.each { |q|
      question= Question.new(dialog: q[:dialog])
      question.right_answer = q[:answer]
      question.options = q[:options]
      question.hint = q[:hint]

      @question.push question
    }
  end

  def get_pregunta (index)
    @question[index].dialog
  end

  def get_options(index)
    @question[index].options
  end

  def verifyAnswer(index, selected_movie)
    result = @question[index].is_right_answer? selected_movie
    set_score result
    result

  end

  def set_score result
    @score += 1 if result
  end

  def get_final_score
    "Your result is #{@score}/#{@question.length}"
  end
end
