class Question

  attr_accessor :dialog, :options, :right_answer

  def initialize opt={}
    @dialog = opt[:dialog]
    @options = opt[:options]
    @right_answer = opt[:right_answer]
  end

  def is_right_answer? text
    @right_answer == text
  end
end