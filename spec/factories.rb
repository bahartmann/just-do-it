FactoryBot.define do

  factory :user do
    name "Ana"
    sequence(:email) { |n| "person-#{n}@mail.com" }
    password "123456"
  end

  factory :task, class: Task do
    description "Something to do"
    done false
  end
end
