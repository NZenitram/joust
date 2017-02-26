require 'rails_helper'

describe '/POST api/v1/comments' do
  it 'creates a new comments' do
    user = create(:user)
    response = Faraday.get('https://code-of-arms.herokuapp.com/api/v1/exercises')
    exercises = JSON.parse(response.body, symbolize_names: true)
    exercise = exercises.first
    solutions = exercise[:solutions]
    first = solutions.first
    second = solutions.second

    headers = {'CONTENT-TYPE' => 'application/json'}

    content = { comment: {winner: first[:id] , loser: second[:id] , comment: "Sick narnia", user_id: user.id } }.to_json

    post '/api/v1/comments', headers: headers, params: content

    expect(response).to be_success
  end
end
