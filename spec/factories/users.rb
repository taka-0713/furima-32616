FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name_kanji {Faker::Name.last_name}
    first_name_kanji {Faker::Name.first_name}
    last_name_kana {Faker::Name.last_name}
    first_name_kana {Faker::Name.first_name}
    date_of_birth {Faker::Date.between}
  end
end
