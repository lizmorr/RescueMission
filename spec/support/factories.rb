FactoryGirl.define do
  factory :question do
    title "c"*50
    detail "d"*150
  end

  factory :answer do
    description "e"*150
    question
  end
end
