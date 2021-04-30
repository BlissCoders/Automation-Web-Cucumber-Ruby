@login @all
Feature: User login feature functionality

  @user_login
  Scenario Outline: User should be able to login with valid credentials
    Given the "<email>" and "<password>"
    Then the user should be able to login

    Examples:
    |email                  |password |
    |sample_test3@sample.com|sample123|

