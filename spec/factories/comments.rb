FactoryGirl.define do
  factory :comment do
    winner 1
    loser 1
    comment "MyString"
    user
  end
end
