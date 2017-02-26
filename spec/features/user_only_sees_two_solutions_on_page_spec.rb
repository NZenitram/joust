require 'rails_helper'

describe 'when a user visits the homepage' do
  context 'the user sees solutions' do
    it 'only sees two solutions' do

      visit '/'

      expect(page).to have_selector('.vote-button', count: 2)
    end
  end
end
