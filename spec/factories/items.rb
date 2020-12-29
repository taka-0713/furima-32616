FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    describe {"状態良好"}
    category_id {2}
    item_status_id {2}
    shipping_cost_id {2}
    prefecture_id {2}
    shipping_date_id {2}
    price{9999}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
