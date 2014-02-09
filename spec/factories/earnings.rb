FactoryGirl.define do
  factory :earning do
    points { [1,10,50,150].shuffle.first}
    association :hacker, :factory => :hacker
    association :user, :factory => :hacker
    association :quest, :factory => :quest
  end
end
