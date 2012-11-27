
FactoryGirl.define do
  factory :care_home, :class => Refinery::CareHomes::CareHome do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

