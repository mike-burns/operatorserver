Feature: Viewing a contact

  Scenario: Requesting a known contact
    When a phone with number "617 867 5309" sends a request for the contact id 1 from the phone "617 606 0842"
    Then the server responds with a 200
    And the server responds with no body

  Scenario: Sending a contact
    When a phone sends the following information as a contact:
      | name           | phone number | address                       |
      | Blues Brothers | 555 555 1212 | 1060 West Addison Chicago, IL |
    Then the server responds with a 200
    And the server responds with no body

  Scenario: Requesting a known contact again
    Given that the server knows the following contact accessible to "617 867 5309":
      | name | contact id | phone number | address                       |
      | Bill | 1          | 555 555 1212 | 1060 West Addison Chicago, IL |
    When a phone with number "617 867 5309" sends a request for the contact id 1 again
    Then the server responds with a 200
    And the server responds with the following contact:
      | name | contact id | phone number | address                       |
      | Bill | 1          | 555 555 1212 | 1060 West Addison Chicago, IL |

  Scenario: Requesting an unknown contact again
    When a phone with number "617 867 5309" sends a request for the contact id 1 again
    Then the server responds with a 404
    And the server responds with no body

  Scenario: Requesting a known contact again but without access
    Given that the server knows the following contact accessible to "617 606 0842":
      | name | contact id | phone number | address                       |
      | Bill | 1          | 555 555 1212 | 1060 West Addison Chicago, IL |
    When a phone with number "617 867 5309" sends a request for the contact id 1 again
    Then the server responds with a 404
    And the server responds with no body

  Scenario: Phone to phone contact sending
    When a phone with number "617 867 5309" sends a request for the contact id 1 from the phone "617 606 0842"
    Then the server responds with a 200
    And the server sends a C2DM request for the contact id 1 to "617 606 0842"
    When the phone with number "617 606 0842" sends the following information as a contact:
      | name           | phone number | address                       | contact id |
      | Blues Brothers | 555 555 1212 | 1060 West Addison Chicago, IL | 1          |
    Then the server responds with a 200
    And the server sends a C2DM request announcing that contact id 1 of "617 606 0842" is ready to "617 867 5309"
    When a phone with number "617 867 5309" sends a request for the contact id 1 again
    Then the server responds with a 200
    And the server responds with the following contact:
      | name | contact id | phone number | address                       |
      | Bill | 1          | 555 555 1212 | 1060 West Addison Chicago, IL |
    And the server has deleted the following contact:
      | name | contact id |
      | Bill | 1          |
