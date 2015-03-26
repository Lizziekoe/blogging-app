require 'rails_helper'

describe "the add a comment process" do
  it "creates a comment on a post" do
  	post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Comment on Post'
    fill_in 'Name', :with => 'Horace'
    fill_in 'Content', :with => 'This is my really lengthy blog post'
    click_on 'Create Comment'
    expect(page).to have_content 'Comment successfully added!'
  end
 end