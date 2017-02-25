require 'rails_helper'

describe 'when a user visits root' do
  it 'sees a solution' do

    visit root_path

    expect(page).to have_content
  end
end
