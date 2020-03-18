FactoryBot.define do
  factory :contractual_relationship do
    user_id { 1 }
    professional_id { 1 }
    state { "MyString" }
  end
end
