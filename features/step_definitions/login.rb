require 'context/create_user'
require 'models/user'

Given /^I am a registered user$/ do
  MyKissList::Context::CreateUser.execute(
    MyKissList::Records::User.new, {'email' => 'foo@bar.com', 'password' => 'foobar'}
  )
end

When /^I successfully log in$/ do
  visit '/session/new'
  fill_in 'Email', :with => 'foo@bar.com'
  fill_in 'Password', :with => 'foobar'
  click_button 'Log In'
end

When /^I unsuccessfully log in$/ do
  visit '/session/new'
  fill_in 'Email', :with => 'foo@bar.com'
  fill_in 'Password', :with => 'fobar'
  click_button 'Log In'
end

Then /^I should be logged in$/ do
  page.status_code.should == 200
end

Then /^I should not be logged in$/ do
  page.current_path.should ==  '/session'
  page.status_code.should == 200
end

Then /^I should see a log in error message$/ do
  find('label[for="email"].error').should have_content('Email error!')
end
