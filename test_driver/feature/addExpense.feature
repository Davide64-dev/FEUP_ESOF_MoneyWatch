Feature: Add Expense Page is opening
  As a user
  I want to add a new purchase to the app
  So I can review it later.

  Scenario: Fail Login
    Given I have "Email"
    When I fill "Email" field with "davidpcu@hotmail.com"
    And I fill "Password" field with "12"
    And I tap "LoginButton"

  Scenario: Fail Login 2
    Given I have "Email"
    When I fill "Email" field with "jh"
    And I fill "Password" field with "123456"
    And I tap "LoginButton"

  Scenario: Fail Login 3
    Given I have "Email"
    When I fill "Email" field with "davidpcu@hotmai1l.com"
    And I fill "Password" field with "123456"
    And I tap "LoginButton"

  Scenario: Fail Login 3
    Given I have "Email"
    And I tap "LoginButton"

  Scenario: Login Success
    Given I have "Email"
    When I fill "Email" field with "davidpcu@hotmail.com"
    And I fill "Password" field with "123456"
    And I tap "LoginButton"

  Scenario: Add Button
    Given I have "MainButton"
    And I tap "MainButton"
    And I tap "AddButton"

  Scenario: Non Functional Add Expense Page
    Given I have "MainButton"
    And I tap "MainButton"
    And I tap "AddButton"
    And I tap "Submit"
    Then I expect an error message

  Scenario: Non Functional Add Expense Page
    Given I have "MainButton"
    And I tap "MainButton"
    And I tap "AddButton"
    And I fill "Amount" field with "000"
    And I tap "Submit"
    Then I expect an error message

  Scenario: Non Functional Add Expense Page
    Given I have "MainButton"
    And I tap "MainButton"
    And I tap "AddButton"
    And I fill "Amount" field with "0,19"
    And I tap "Submit"
    Then I expect an error message

  Scenario: Functional Forum Page
    Given I have "MainButton"
    And I tap "MainButton"
    And I tap "Forum"

  Scenario: Functional Forum Page
    Given I have "MainButton"
    And I tap "MainButton"
    And I tap "Statistics"

