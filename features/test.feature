Feature: Basic scenarios for derp-bear examples

  Scenario: I can submit the Simple Example form
    When I submit the Simple Example form with valid form data
    Then I should see that the form has been submitted successfully