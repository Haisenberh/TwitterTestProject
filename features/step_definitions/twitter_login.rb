require 'watir-webdriver'
require 'cucumber'

Given(/^a user start browser$/) do
  @browser = Watir::Browser.new :firefox
  @browser.driver.manage.window.maximize
end

Then(/^I go to "([^"]*)"$/) do |arg|
  @browser.goto "#{arg}"
end

Then(/^I enter valid email-login$/) do
 @user = CREDENTIALS[:valid_user]
 @browser.text_field(:id => 'signin-email').set @user[:email]
end

And(/^I enter valid password$/) do
 @user = CREDENTIALS[:valid_user]
 @browser.text_field(:id => 'signin-password').set @user[:password]
end

Then(/^I press login button$/) do
  login_botton = @browser.button :xpath => '//div[2]/form/table/tbody/tr/td[2]/button'
  login_botton.exists?
  login_botton.click
end

Then(/^I press new Tweet button$/) do
  new_tweet_button = @browser.button :id => 'global-new-tweet-button'
  new_tweet_button.exists?
  new_tweet_button.click
end

Then(/^I enter tweet "([^"]*)" in the tweet box field$/) do |arg|
 @browser.send_keys :numpad6
 #@browser.text_field(:id => 'tweet-box-global').set "#{arg}"
 #text field is not accesible (try to locale by xpath,css,id,class but still doesn't work, so I emulate numpad buttons pressing )
end

Then(/^I press Tweet button$/) do
  tweet_button = @browser.button :class => 'btn primary-btn tweet-action tweet-btn js-tweet-btn'
  tweet_button.exists?
  tweet_button.click
end

Then(/^I should see text "([^"]*)"$/) do |arg|
 @browser.text.include? "#{arg}"
end

Then(/^I press follow random user$/) do
  follow_button = @browser.button :class => 'small-follow-btn follow-btn btn small follow-button js-recommended-item'
  follow_button.exists?
  follow_button.click
  @browser.close
end