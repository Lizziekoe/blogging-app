require 'rails_helper'

describe "the process of creating a new comment" do
  it "will show form when new comment is clicked", js: true do
    post = FactoryGirl.create(:post)
    visit posts_path(post)
    save_screenshot('create_commentt.png')
    click_on 'new_comment_link'
    expect(page).to have_content 'Name'
  end
end