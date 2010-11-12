Feature: User logging in

  As a user
  I want to login with my details
  So that I can get access to the site

  Scenario: User uses wrong password

    Given a username 'jdoe'
    And a password 'wrong'

    When the user logs in with username and password

    Then the login form should be shown again

  Scenario: Creates a new user

    Given a username 'jdoe2'
    And a password 'letmein'
    And an email 'jdoe@test.com'
    And there is no user with this username

    When the user creates an account with username, password and email

    Then there should be a user named 'jdoe2'
    And should redirect to '/'
  