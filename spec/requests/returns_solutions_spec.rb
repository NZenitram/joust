require 'rails_helper'

describe '/GET exercises' do
  context 'returns exercises'do
    it 'returns a 200' do

      response = Faraday.get('https://code-of-arms.herokuapp.com/api/v1/exercises')

      expect(response).to be_success
    end
  end
  context 'returns exercise solutions' do
    it 'returns a 200' do

      response = Faraday.get('https://code-of-arms.herokuapp.com/api/v1/exercises/2')

      expect(response).to be_success
    end

    it 'returns solution content' do

      response = Faraday.get('https://code-of-arms.herokuapp.com/api/v1/exercises/2')

      

      expect(response).to have_content("ham ham ham")
    end
  end
end
