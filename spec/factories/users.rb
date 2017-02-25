FactoryGirl.define do
  factory :user do

    census_id 14

    token ENV["census_token"]
  end
end
