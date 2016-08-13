Feature:
  As Marcela
  I want to be able to guess a movie's dialog
  To verify my knowledge of movie's dialogs

  Scenario: I want to see a question with its options
    Given I open the web app
    Then I should see "Why so serious?"
    And I should see "Terminator"
    And I should see "Batman the dark night"
    And I should see "Batman begins"
    And I should see "Batman forever"
    
  Scenario: I could select a question and validate if it's ok
    Given I open the web app
    When I select "Batman_begins"
    And I press "validar"
    Then I should see "Correcto"