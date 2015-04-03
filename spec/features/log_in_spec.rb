require 'rails_helper'

describe "the log in process" do
  it "will display the sign up button on the home page" do
    visit '/'
    expect(page).to have_content 'Login'
  end

  it "will Log In user when form is filled out correctly" do
    User.create({email: "liz@zie.com", password: "12345678"})
    visit 'users/sign_in'
    fill_in 'Email', with: "liz@zie.com"
    fill_in 'Password' , with: "12345678"
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  it "will provide an error message when password is not filled out correctly" do
    visit 'users/sign_in'
    fill_in 'Email', with: "liz@zie.com"
    fill_in 'Password' , with: "1234567"
    click_on 'Log in'
    expect(page).to have_content 'Invalid'
  end

end