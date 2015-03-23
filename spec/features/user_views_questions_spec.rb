require 'rails_helper'

feature 'user_views_questions' do
  # As a user
  # I want to view recently posted questions
  # So that I can help others
  #
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first
  scenario 'user sees questions at root page' do
    question1 = Question.create(title: "What is the best approach to TDD?")
    question2 = Question.create(title: "Why is the sky blue?")

    visit '/'

    page.assert_selector('ul#all_questions li:first-child', text: question2.title)
    page.assert_selector('ul#all_questions li:last-child', text: question1.title)


  end

  scenario 'user sees questions at /questions' do
    question1 = Question.create(title: "What is the best approach to TDD?")
    question2 = Question.create(title: "Why is the sky blue?")

    visit '/questions'

    page.assert_selector('ul#all_questions li:first-child', text: question2.title)
    page.assert_selector('ul#all_questions li:last-child', text: question1.title)

  end

end