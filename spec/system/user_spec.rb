require 'rails_helper'

RSpec.describe "Users", type: :system do
  # pending "add some scenarios (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.create(:user)
  end
  it "create new user" do
    visit root_path
    click_link "Sign up"
    expect{
      fill_in "First Name",with:@user.first_name
      fill_in "Last Name",with:@user.last_name
      fill_in "Email",with:@user.email
      fill_in "Password",with:@user.password
      fill_in "Password confirmation",with:@user.password
      click_button "Sign up"
    }.to change{User.count}.by(1)
  end
end
