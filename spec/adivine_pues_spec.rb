#enconding utf-8

require './lib/adivine_pues'

describe AdivinePues do
  before(:each) do
    @adivine_pues = AdivinePues.new
  end

  it 'al solicitar una pregunta debe retornar "Why so serious"' do
    result = @adivine_pues.get_pregunta 0
    result.should == "Why so serious?"
  end

  it 'al pasar la pregunta "Why so serious" debe traer las opciones para escoger' do
    result = @adivine_pues.get_options 0
    result.should == [
        'Terminator',
        'Batman the dark knight',
        'Batman begins',
        'Batman forever'
    ]
  end

  it 'al verificar respuesta  "Batman the dark night" a la pregunta "Why so serious" debe retornar true' do
    answer = "Batman the dark knight"
    result = @adivine_pues.verifyAnswer(0, answer)
    result.should == true
  end

  it 'al verificar respuesta  "Terminator" a la pregunta "Why so serious" debe retornar false' do
    answer = "Terminator"
    result = @adivine_pues.verifyAnswer(0, answer)
    result.should == false
  end

  it 'al solicitar una segunda pregunta debe retornar "They may take our lives, but they will never take our freedom"' do
    result = @adivine_pues.get_pregunta 1
    result.should == "They may take our lives, but they will never take our freedom"
  end

  it 'muestra el score final cuando ha seleccionado 1 buena y 2 malas como "Your result is 1/3"' do
    @adivine_pues.verifyAnswer(0, "Batman the dark knight")
    @adivine_pues.verifyAnswer(1, "Lord of the rings")
    @adivine_pues.verifyAnswer(2, "God fellas")
    result = @adivine_pues.get_final_score
    result.should == "Your result is 1/3"
  end

end