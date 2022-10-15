FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.name }
    email                   { Faker::Internet.free_email }
    password                { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    last_name               { '山田' }  #gem 'gimei'インストールしていないため、Fakerは使わない
    first_name              { '太郎' }
    last_name_kana          { 'ヤマダ' }
    first_name_kana         { 'タロウ' }
    birthday                { Faker::Date.birthday }
  end
end