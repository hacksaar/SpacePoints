FactoryGirl.define do

  sequence :nickname do |n|
    "#{n}hacker"
  end

  factory :hacker do
    nickname { generate(:nickname) }
    email    { Faker::Internet.email }
    password {'test1234'}

    trait :cool_kim do
      nickname 'KimCM'
    end

    trait :with_earning do
      earnings {[FactoryGirl.build(:earning, :hacker => nil)]}
    end

    factory :hacker_with_earning, :traits => [:with_earning]
  end
end
