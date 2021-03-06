Feature: View the operator's contacts

  @wip
  Scenario: Phone requests the operator's contacts and the contact exists
    Given a contact exists with a phone number of "617 867 5309"
    When a phone requests the contacts for "617 867 5309"
    Then the server responds with a 200
    And the server responds with no body

  @wip
  Scenario: Phone requests the operator's contacts for the first time
    When a phone requests the contacts for "617 867 5309"
    Then the server responds with a 200
    And the server responds with no body
    And the server sends a C2DM request for all contacts to "617 867 5309"

  @wip
  Scenario: Registered phone sends its list of names in the contact list
    Given a phone with the number "617 867 5309" is already registered
    When a phone with number "617 867 5309" sends the following as its list of contacts:
      | name | contact id |
      | Bill | 1          |
    Then the server responds with a 200
    And the server responds with no body

  @wip
  Scenario: Unregistered phone sends its list of names in the contact list
    When a phone with number "617 867 5309" sends the following as its list of contacts:
      | name | contact id |
      | Bill | 1          |
    Then the server responds with a 404
    And the server responds with the body "unregistered phone number"

  @wip
  Scenario: Phone requests the operator's contacts, knowing that they are on the server
    Given the server knows the following contacts for "617 867 5309":
      | name | contact id |
      | Bill | 1          |
      | Fred | 2          |
      | Matt | 4          |
    When a phone requests the contacts for "617 867 5309" again
    Then the server responds with a 200
    And the server responds with the following list of contacts:
      | name | contact id |
      | Bill | 1          |
      | Fred | 2          |
      | Matt | 4          |

  @wip
  Scenario: Phone to phone contact list request
    Given a phone with the number "617 867 5309" is already registered
    And a phone with the number "617 606 0842" is already registered
    When the phone "617 606 0842" requests the contacts for "617 867 5309"
    Then the server responds with a 200
    And the server sends a C2DM request for all contacts to "617 867 5309"
    When a phone with number "617 867 5309" sends the following as its list of contacts:
      | name | contact id |
      | Bill | 1          |
      | Matt | 4          |
    Then the server responds with a 200
    And the server sends a C2DM request announcing the contacts as ready to "617 606 0842"
    When the phone "617 606 0842" requests the contacts for "617 867 5309" again
    Then the server responds with a 200
    And the server responds with the following list of contacts:
      | name | contact id |
      | Bill | 1          |
      | Matt | 4          |
    And the server has deleted the following contacts:
      | name | contact id |
      | Bill | 1          |
      | Matt | 4          |
