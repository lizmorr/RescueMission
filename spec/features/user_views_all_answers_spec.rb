require 'rails_helper'

feature "user views answers" do
  scenario "answers_displayed" do
    question1 = FactoryGirl.create(:question)
    answer1 = FactoryGirl.create(:answer, question: question1)
    answer2 = FactoryGirl.create(:answer, description: "x"*150, question: question1)

    visit question_path(question1)

    page.assert_selector('ul#all_questions li:first-child', text: answer2.description)
    page.assert_selector('ul#all_questions li:last-child', text: answer1.description)

  end
end
