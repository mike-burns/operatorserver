Feature: Registration

  @wip
  Scenario: Already registered phone requests with the server
    Given a phone with id "abcde" is already registered
    When a phone sends a request to register with the id "abcd"
    Then the server responds with a 200
    And the server responds with no body

  @wip
  Scenario: Phone registers with the server
    When a phone sends a request to register with the id "abcd"
    Then the server responds with a 200
    And the server responds with no body
