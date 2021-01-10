FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    prefecture_id {3}
    municipalities {"八戸市"}
    block_number {"八戸1-2-3"}
    building_name {"八戸ビル"}
    phone_number {"09012345678"}
  end
end
