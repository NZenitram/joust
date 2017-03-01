require 'rails_helper'

describe 'when a user visits the homepage' do
  context 'the user sees solutions' do
    it 'only sees two solutions' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      expect(page).to have_button('Vote', count: 2)
    end
  end
end
