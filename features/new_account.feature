@register @all
Feature: Register a new account functionality

  @wip
  Scenario Outline: Register a new account from CSV file
    Given the "<email>" provided to create a new user account
    When the information needed is entered from CSV to create the account
    Then new account should be created


  Examples:
    |email|
    |sample_test1@sample.com|
    |sample_test2@sample.com|
    |sample_test4@sample.com|