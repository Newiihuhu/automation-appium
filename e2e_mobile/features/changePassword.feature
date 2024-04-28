@changePassword
Feature: change password

  Scenario Outline: As a user, I can change password and login with new password
    Given I am on the onboarding screen
    Given I am on the login screen
    When I login with email "nutsrk@odds.team" and password "123456"
    Then I should see dashboard screen

    When Click on setting button and change password
    Then I should see the setting screen
    When I click change password button
    Then I should see the change password screen
    When I enter the old password "<oldPassword>" and new password "<newPassword>"
    Then Click on the  change password button
    
