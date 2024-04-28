@register
Feature: Register

 Scenario Outline: As a user, I can register new account
   Given I am on the onboarding screen
   Given I am on the login screen
   Given I am on the register screen
   When I register with username "testtest" email "testtest@mail.com" and password "Test@1234"
   Then I should register success