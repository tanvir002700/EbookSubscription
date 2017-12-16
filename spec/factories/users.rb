FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email) { |n| "user-#{User.count}@example.com" }
    password 'please123'
    roles [:user]
  end

  factory :admin, class: User do |u|
    u.sequence(:email) { |n| "admin-#{User.count}@example.com" }
    password 'please123'
    roles [:admin]
  end
end


