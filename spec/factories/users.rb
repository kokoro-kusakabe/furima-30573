FactoryBot.define do
  require 'faker/japanese'
  factory :user do
    nickname {Faker::Internet.user_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password
    password {password}
    password_confirmation {password}
    name_first {Faker::Japanese::Name.first_name}
    name_last { Faker::Japanese::Name.last_name }
    name_reading_first { 'タナカ'}
    name_reading_last {'タロウ'}
    birthday { 1995_12_23 }
  end
end
