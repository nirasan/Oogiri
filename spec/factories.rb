FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "user#{i}" }
    sequence(:password) { |i| "password#{i}" }
    email { "#{name}@example.com" }
  end
  factory :question do
    sequence(:title) { |i| "question#{i}" }
    category :man
    image { File.open("spec/images/512x512.png") }
  end
  factory :answer do
    sequence(:body) { |i| "answer#{i}" }
    category :other
  end
  factory :comment do
    sequence(:body) { |i| "comment#{i}" }
  end
end