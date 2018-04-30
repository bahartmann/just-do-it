FactoryBot.define do

  factory :user do
    id 1
    name "Ana"
    email "ana@gmail.com"
    password "123456"
  end

  factory :task, class: Task do
    description "Something to do"
    done false
    user_id 1
  end
end
