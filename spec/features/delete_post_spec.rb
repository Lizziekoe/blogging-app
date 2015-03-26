require 'rails_helper'

describe "the delete a post process" do
  it "deletes a post" do
  	post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Delete Post'
    expect(page).to have_content 'successfully deleted'
  end
 end