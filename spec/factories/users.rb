FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email) { |n| "user#{n}@example.com" }
    password 'please123'
    roles [:user]
  end

  factory :admin do |u|
    u.sequence(:email) { |n| "user#{n}@example.com" }
    password 'please123'
    roles [:admin]
  end
end


