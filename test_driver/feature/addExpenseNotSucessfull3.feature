Feature: Add Expense Page is opening
  As a user
  I want to add a new purchase to the app
  So I can review it later.

  Scenario: Non Functional Add Expense Page
    Given I have "MainButton"
    When I tap "MainButton"
    And I tap "AddButton"
    And I fill "Amount" field with "0,19"
    And I tap "Submit"
    Then I expect an error message
