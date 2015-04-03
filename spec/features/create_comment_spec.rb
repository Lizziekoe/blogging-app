require 'rails_helper'

describe "the process of creating a new comment", :vcr => true do
  it "will show form when new comment is clicked", js: true do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Comment on Post'
    expect(page).to have_content 'Name'
  end



end