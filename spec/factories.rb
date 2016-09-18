FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@gmail.com" } 
    password 'Test1234'
    password_confirmation 'Test1234'
    confirmed_at Time.now.utc
  end

  factory :entry do
    title 'Title'
    body 'Text'
  end
end