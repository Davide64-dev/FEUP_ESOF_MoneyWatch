Feature: Add Expense Page is opening
  As a user
  I want to add a new purchase to the app
  So I can review it later.

  Scenario: Non Functional Add Expense Page
    Given I have "Email"
    When I fill "Email" field with "davidpcu@hotmail.com"
    And I fill "Password" field with "123456"
    And I tap "LoginButton"
    And I have "MainButton"
    And I tap "MainButton"
    And I tap "AddButton"
    And I fill "Amount" field with "0,19"
    And I tap "Submit"
    Then I expect an error message
