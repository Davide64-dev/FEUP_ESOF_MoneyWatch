Feature: Login
  As a user
  I want to add a new purchase to the app
  So I can review it later.

  Scenario: Add Expense Page Successful
    Given I am on the homepage screen
    When I tap the floating action button
    And I tap the plus button
    Then I should see the add expense screen