require 'rails_helper'

feature 'user edits question' do
  scenario 'user successfully edits' do
    question_to_edit = FactoryGirl.create(:question)
    visit question_path(question_to_edit)

    click_on 'Revise Question'

    fill_in('Title', with: 'j'*40)
    fill_in('Detail', with: 'k'*150)

    click_on 'Submit Revision'

    expect(page).to have_content('Question revised')
    expect(page).to have_content('j'*40)
    expect(page).to have_content('k'*150)

    visit questions_path
    expect(page).to have_no_content(question_to_edit.title)

  end

  scenario 'user edits with invalid information' do
    question_to_edit = FactoryGirl.create(:question)
    visit question_path(question_to_edit)

    click_on 'Revise Question'

    fill_in('Title', with: 'j'*20)
    fill_in('Detail', with: 'k'*100)

    click_on 'Submit Revision'

    expect(page).to have_content('Title is too short (minimum is 40 characters)')
    expect(page).to have_content('Detail is too short (minimum is 150 characters)')

    expect(page).to have_field('Title', with: "j"*20)
    expect(page).to have_field('Detail', with: "k"*100)
  end

end
