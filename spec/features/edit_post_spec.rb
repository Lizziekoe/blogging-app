require 'rails_helper'

describe "the edit a post process" do
  it "edits a post" do
  	post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Edit Post'
    fill_in 'Title', :with => 'A new post'
    fill_in 'Date', :with => 'Today'
    fill_in 'Content', :with => 'This is my really lengthy blog post'
    click_on 'Update Post'
    expect(page).to have_content 'successfully updated'
  end
 end