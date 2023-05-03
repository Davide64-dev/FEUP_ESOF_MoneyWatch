Feature: Forum Page is opening
  As a user
  I would like to be able to ask a question in a forum organized by categories that users can create
  so that other people can answer me and we can exchange ideas.

  Scenario: Functional Forum Page
    Given I have "Email"
    When I fill "Email" field with "davidpcu@hotmail.com"
    And I fill "Password" field with "123456"
    And I tap "LoginButton"
    And I have "MainButton"
    And I tap "MainButton"
    And I tap "Forum"
