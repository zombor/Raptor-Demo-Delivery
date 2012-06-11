Feature: User Login

  Scenario: User successfully logs in
    Given I am a registered user
    When I successfully log in
    Then I should be logged in

  Scenario: User fails to log in
    Given I am a registered user
    When I unsuccessfully log in
    Then I should not be logged in
    And I should see a log in error message
