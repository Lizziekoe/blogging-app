describe "the process of sending a message" do
  it "will send a message when the number has been verified" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Comment on Post'
    fill_in 'Name', :with => 'Test Name'
    fill_in 'Comment', :with => 'Test Comment'
    expect(page).to have_content 'Message Successfully Sent'
  end
end