class Question

  attr_accessor :dialog, :options, :right_answer, :hint

  def initialize opt={}
    @dialog = opt[:dialog]

  end

  def is_right_answer? text
    @right_answer == text
  end
end