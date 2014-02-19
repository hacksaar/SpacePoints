FactoryGirl.define do
  factory :cancel do
    association :hacker, :factory => :hacker
    association :user, :factory => :hacker
  end
end
