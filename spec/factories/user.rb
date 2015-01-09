FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" } 
    password 'password'
    password_confirmation { |u| u.password }
    sequence(:name) { |n| "John#{n}" } 
  end
end

