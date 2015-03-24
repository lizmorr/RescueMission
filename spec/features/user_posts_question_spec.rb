require 'rails_helper'

feature 'user_views_details' do
  # As a user
  # I want to post a question
  # So that I can receive help from others
  #
  # Acceptance Criteria
  #
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  scenario 'user_posts_question succesfully' do
    visit '/'
    click 'Ask a new question'

    fill_in(:title, with: "c"*40)
    fill_in(:description, with: "d"*150)
    click 'Submit question'

    expect(page).to have_content("c"*55)
    expect(page).to have_content("d"*155)
  end

  pending 'user fills out form with missing infomation'

  pending 'user fills out forms with invalid information'

end
