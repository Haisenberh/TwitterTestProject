Feature: Testing twitter functionality

@valid
Scenario: Users can login into Twitter
Given a user start browser
Then I go to "https://twitter.com"
Then I enter valid email-login
And I enter valid password
Then I press login button
Then I press new Tweet button
Then I enter tweet "I wrote cucumber test" in the tweet box field
Then I press Tweet button
Then I should see text "Your Tweet was posted!"
Then I press follow random user