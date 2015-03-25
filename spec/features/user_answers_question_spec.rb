require 'rails_helper'

feature 'user_answers_questions' do
  # As a user
  # I want to answer another user's question
  # So that I can help them solve their problem
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario 'user_successfully_answers' do
    question = Question.create(title: "c"*40, detail: "d"*150)
    visit "/questions/#{question.id}"

    fill_in 'Answer', with: "s"*50

    click_on 'Answer Question'

    expect(page).to have_content ('Question answered!')
    expect(page).to have_content ("s"*50)
  end

  scenario 'user_submits_invalid_information' do
    question = Question.create(title: "c"*40, detail: "d"*150)
    visit "/questions/#{question.id}"

    fill_in 'Answer', with: "s"*40

    click_on 'Answer Question'

    expect(page).to have_content ('Description is too short (minimum is 50 characters)')
  end

end
