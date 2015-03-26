require 'rails_helper'

feature 'user deletes question' do

# As a user
# I want to delete a question
# So that I can delete duplicate questions
#
# Acceptance Criteria
#
# - I must be able delete a question from the question edit page
# - I must be able delete a question from the question details page
# - All answers associated with the question must also be deleted

  scenario 'user deletes from question deletion page' do
    question_to_keep = FactoryGirl.create(:question, title: "fd"*25)
    question_to_delete = FactoryGirl.create(:question)

    visit question_path(question_to_delete)
    click_on 'Delete Question'

    expect(page).to have_no_content(question_to_delete.title)
    expect(page).to have_content('Question deleted.')
    expect(page).to have_content(question_to_keep.title)
  end

  scenario 'user deletes from question edit page' do
    question_to_keep = FactoryGirl.create(:question, title: "fd"*25)
    question_to_delete = FactoryGirl.create(:question)

    visit edit_question_path(question_to_delete)
    click_on 'Actually, just delete this'

    expect(page).to have_no_content(question_to_delete.title)
    expect(page).to have_content('Question deleted.')
    expect(page).to have_content(question_to_keep.title)
  end

end
