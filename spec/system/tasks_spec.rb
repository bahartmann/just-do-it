require "rails_helper"

RSpec.feature "Tasks", type: :system do

  let(:user) { FactoryBot.create(:user) }

  scenario "user visits Task index" do
    login_as user
    visit tasks_url
    assert_selector "h4", text: "#{user.name}'s tasks"
  end

  scenario "user creates task" do
    login_as user
    visit tasks_url

    expect {
      click_link "New Task"
      fill_in "Description", with: "Trying out Capybara"
      click_on "Create Task"

      expect(page).to have_content "Task was successfully created."
    }.to change(user.tasks, :count).by(1)
  end

end
