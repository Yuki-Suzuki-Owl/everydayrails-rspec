require 'rails_helper'
RSpec.describe "Projects",type: :system do
  scenario "user creates a new project" do
    user = FactoryBot.create(:user)
    sign_in user
  end
end
