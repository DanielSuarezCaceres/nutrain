FactoryBot.define do
  factory :meal do
    name { "MyString" }
    description { "MyText" }
    file { "MyString" }
    user { nil }
  end
end
