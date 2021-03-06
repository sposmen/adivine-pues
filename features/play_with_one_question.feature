Feature:
  As Marcela
  I want to be able to guess a movie's dialog
  To verify my knowledge of movie's dialogs

  Scenario: I want to see a question with its options
    Given I open the web app
    Then I should see "Why so serious?"
    And I should see "Terminator"
    And I should see "Batman the dark knight"
    And I should see "Batman begins"
    And I should see "Batman forever"

  Scenario: I could select a question and validate if it's ok
    Given I open the web app
    When I select "batman_the_dark_knight"
    And I press "go"
    Then I should see "Hint!"

  Scenario: I can go back to the main page
    Given I open the web app
    And I select "batman_the_dark_knight"
    And I press "go"
    And I press "go"
    And I press "go"
    And I press "go"
    And I press "go"
    When I click on "Play again"
    Then I should see "Why so serious?"

  Scenario: I can see the results in %
    Given I open the web app
    And I select "batman_the_dark_knight"
    And I press "go"
    And I select "bravehearth"
    And I press "go"
    And I select "the_godfather"
    And I press "go"
    And I press "go"
    And I press "go"
    Then I should see "Your result is 60%"

  Scenario: I see a hint
    Given I open the web app
    Then I should see "Hint"