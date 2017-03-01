require 'rails_helper'

describe 'a user can log in' do
  scenario 'when a user vists root it can log in' do
    stub = stub_omniauth
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'
    expect(page).to have_content('Login with Census')


    visit '/'
    expect(page).to have_content('Log Out')
  end
end

describe 'a user can log out' do
  scenario 'when a logged in user visits root, it can log out' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    expect(page).to have_content('Log Out')
  end
end
