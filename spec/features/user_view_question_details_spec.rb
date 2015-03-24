require 'rails_helper'

feature 'user_views_details' do
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question
  #
  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description
  scenario 'user links to details' do
    question1 = Question.create(title: "x"*41, detail: "a"*151)

    visit root_path

    click_link(question1.title)

    expect(page).to have_content(question1.title)
    expect(page).to have_content(question1.detail)
  end
end
