class AdivinePues


  def get_pregunta
    "Why so serious"
  end
  def get_options dialog
    [
        'Terminator',
        'Batman the dark night',
        'Batman begins',
        'Batman forever'
    ]
  end

  def verifyAnswer dialog, selected_movie
    if selectedMovie == 'Batman the dark night'
      true
    else
      false
    end
  end
end
