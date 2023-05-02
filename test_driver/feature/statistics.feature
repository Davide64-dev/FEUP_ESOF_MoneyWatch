Feature: Forum Page is opening
  As a user
  I want to check how much I spent in each category last month
  So that I can spend more efficiently.

  Scenario: Functional Forum Page
    Given I have "Email"
    When I fill "Email" field with "davidpcu@hotmail.com"
    And I fill "Password" field with "123456"
    And I tap "LoginButton"
    And I have "MainButton"
    And I tap "MainButton"
    And I tap "Statistics"
