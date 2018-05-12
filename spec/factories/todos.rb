FactoryGirl.define do
  factory :todo do
    title "Monday"
    body "Laundry fun night."

    trait(:tuesday) do
      title "Tuesday"
      body "It's Taco Tuesday!"
    end
  end
end
