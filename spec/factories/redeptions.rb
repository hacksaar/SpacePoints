FactoryGirl.define do
  factory :redemption do
    points { [1,10,50,150].shuffle.first}
    association :hacker, :factory => :hacker
    association :user, :factory => :hacker
    association :reward, :factory => :reward
  end
end
