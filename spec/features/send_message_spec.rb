describe "the process of sending a message", :vcr => true do
  it "will send a message when the number has been verified" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Comment on Post'
    fill_in 'Name' with 'Test Name'
    fill_in 'Comment' with 'Test Comment'
    expect(page).to have_content 'Message Successfully Sent'
  end

  it "will give an error meassge when the number has not been verified" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    fill_in 'to-field', with: '2564'
    fill_in 'Body', with: "Woot woo"
    click_on 'Twext Them'
    expect(page).to have_content 'not a valid phone number'
  end

end