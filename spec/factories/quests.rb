FactoryGirl.define do
  factory :quest do
    points {[10,20,50,150].shuffle.first}
    title  {Faker::Lorem.word }
    description  {Faker::Lorem.sentence }
  end
end
