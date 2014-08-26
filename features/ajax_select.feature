Feature: Testing the ajax select list

  Scenario: Select list should allow you to choose option
    Given I am on the "Simple Ajax Select Example" page
    When I choose a Year and Make and submit the form
    Then I should see that the form was submitted successfully
    And I should see my selections displayed on the page