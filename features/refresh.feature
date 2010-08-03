Feature: Refreshing the contact list of potential operators

  Scenario: Phone sends all phone numbers in contact list
    Given the following contacts exist:
      | phone number |
      | 555 123 1212 |
      | 666 666 6666 |
      | 617 867 5309 |
    When a phone asks if the following phone numbers are in the system:
      | 617 867 5309 |
      | 617 606 0842 |
    Then the server responds with the following phone numbers:
      | 617 867 5309 |
