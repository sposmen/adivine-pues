require './lib/question'

require './lib/question_db'

class AdivinePues

  attr_accessor :question

  def initialize
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
    @question[index].is_right_answer? selected_movie

  end
end
