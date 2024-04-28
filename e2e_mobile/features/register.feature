@register
Feature: Register

  Scenario Outline: As a user, I can go to register screen
    Given I am on the onboarding screen
    Given I am on the login screen
    When I click create your account
    Then I should see register screen

 Scenario Outline: As a user, I can register new account 
    Given I am on the register screen
    When I fill all fields with username "testtest" email "testtest@mail.com" and password "Test@1234"
    When I click sign up button
    Then I should see login screen

 Scenario Outline: As a user, I can register new account 
    Given I am on the register screen
    When I fill all fields
    When I click sign up button
    Then I should see login screen