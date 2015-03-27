require 'rails_helper'

feature 'markdown is supported' do
  scenario 'user submits question with title using markdown' do
    question = FactoryGirl.create(:question, title: "Hello! *This* is"+"z"*40)
    visit question_path(question)
    expect(page).to have_css('#title_block em', text: "This")
  end

  scenario 'user submits question with details using markdown' do
    question = FactoryGirl.create(:question, detail: "*This* is detail"+"z"*150)
    visit question_path(question)
    expect(page).to have_css('#detail_block em', text: "This")
  end

  scenario 'user submits answer using markdown' do
    answer = FactoryGirl.create(:answer, description: "*Hello*"+"z"*120)
    visit question_path(answer.question)
    expect(page).to have_css('#all_answers em', text: "Hello")
  end
end
