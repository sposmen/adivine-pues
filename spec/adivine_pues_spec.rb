#enconding utf-8

require './lib/adivine_pues'

describe AdivinePues do
  before(:each) do
    @adivine_pues = AdivinePues.new
  end

  it 'al solicitar una pregunta debe retornar "Why so serious"' do
    result = @adivine_pues.get_pregunta
    result.should == "Why so serious?"
  end

  it 'al pasar la pregunta "Why so serious" debe traer las opciones para escoger' do
    result = @adivine_pues.get_options
    result.should == [
      'Terminator',
      'Batman the dark knight',
      'Batman begins',
      'Batman forever'
    ]
  end

  it 'al verificar respuesta  "Batman the dark night" a la pregunta "Why so serious" debe retornar true' do
    movie = "Why so serious"
    answer = "Batman the dark knight"
    result = @adivine_pues.verifyAnswer(movie, answer)
    result.should == true
  end

  it 'al verificar respuesta  "Terminator" a la pregunta "Why so serious" debe retornar false' do
    movie = "Why so serious"
    answer = "Terminator"
    result = @adivine_pues.verifyAnswer(movie, answer)
    result.should == false
  end

end