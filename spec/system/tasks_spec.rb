require "rails_helper"

RSpec.feature "Tasks", type: :system do

  let(:user) { FactoryBot.create(:user) }

  scenario "user visits Task index" do
    login_as user
    visit tasks_url
    assert_selector "h4", text: "#{user.name}'s tasks"
  end

  scenario "user creates Task" do
    login_as user
    visit tasks_url

    expect {
      click_link "New Task"
      fill_in "Description", with: "Something to do"
      click_button "Save task"

      expect(page).to have_content "Task was successfully created."
    }.to change(user.tasks, :count).by(1)
  end

  scenario "user updates Task description" do
    task = FactoryBot.create(:task, description: "Read book", user_id: user.id)

    login_as user
    visit tasks_url

    click_link "Edit"
    fill_in "Description", with: "Read newspaper"
    click_button "Save task"

    expect(page).to have_content "Task was successfully updated."
    expect(page).to have_content "Read newspaper"
  end

  scenario "user marks Task as done" do
    task = FactoryBot.create(:task, description: "Read book", user_id: user.id)

    login_as user
    visit tasks_url

    expect {
      click_link "Edit"
      check "Done"
      click_button "Save task"
    }.to change { ActionMailer::Base.deliveries.count }.by(1)

    expect(page.first(".task")).to have_content "true"
  end

  scenario "user marks Task as undone back" do
    task = FactoryBot.create(:task, description: "Read book", user_id: user.id, done: true)

    login_as user
    visit tasks_url

    expect {
      click_link "Edit"
      uncheck "Done"
      click_button "Save task"
    }.to change { ActionMailer::Base.deliveries.count }.by(0)

    expect(page.first(".task")).to have_content "false"
  end

  scenario "user destroys Task", js: true do
    task = FactoryBot.create(:task, description: "Read book", user_id: user.id)

    login_as user
    visit tasks_url

    expect {
      click_link "Edit"

      accept_alert do
        click_link "Destroy task"
      end

      expect(page).to have_content "Task was successfully destroyed."
    }.to change(user.tasks, :count).by(-1)
  end
end
