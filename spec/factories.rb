FactoryBot.define do

  factory :user do
    name "Ana"
    email "ana@gmail.com"
    password "123456"
  end

  factory :task, class: Task do
    description "Something to do"
    done false
  end
end
