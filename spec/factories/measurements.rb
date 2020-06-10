FactoryBot.define do
  factory :measurement do
    weight { 1 }
    neck_size { 1 }
    chest_size { 1 }
    arm_size { 1 }
    waist_size { 1 }
    hips_size { 1 }
    leg_size { 1 }
    user { nil }
  end
end
