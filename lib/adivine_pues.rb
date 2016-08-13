class AdivinePues


  def get_pregunta
    "Why so serious"
  end
  def get_options dialog
    [
        'Terminator',
        'Batman the dark knight',
        'Batman begins',
        'Batman forever'
    ]
  end

  def verifyAnswer dialog, selectedMovie
    if selectedMovie == 'Batman the dark knight'
      true
    else
      false
    end
  end
end
