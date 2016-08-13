require './lib/question'

require './lib/question_db'

class AdivinePues

  attr_accessor :questions, :hints_used

  def initialize
    @score=0.0
    @hints_used = 0
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

  def set_hint_used hint="f"
    @hints_used += 1 if hint == "t"
  end

  def set_score result
    @score += 1 if result
  end

  def get_final_score
    discount = @hints_used * 0.05
    last_score = (((@score/5) - discount) * 100).round(0)
    "Your result is #{last_score}%"
  end
end
