require 'rails_helper'

describe "the add a post process" do
  it "creates a post" do
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', :with => 'A new post'
    fill_in 'Date', :with => 'Today'
    fill_in 'Content', :with => 'This is my really lengthy blog post'
    click_on 'Create Post'
    expect(page).to have_content 'successfully'
  end
 end