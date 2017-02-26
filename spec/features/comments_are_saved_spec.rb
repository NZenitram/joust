require 'rails_helper'

describe 'when a user votes on a comment' do
  it 'saves the comment' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'
    within('#solution-code-one') do
      click_on 'Vote'
    end
    save_and_open_page

    expect(page).to have_content('Vote')
  end
end
