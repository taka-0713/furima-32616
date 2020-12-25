FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name_kanji {"大須賀"}
    first_name_kanji {"タカふみ"}
    last_name_kana {"オオスガ"}
    first_name_kana {"タカフミ"}
    date_of_birth {"1988-04-04"}
  end
end
