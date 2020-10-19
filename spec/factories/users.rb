FactoryBot.define do
  factory :user do
    nickname              { 'duffy' }
    email                 { 'ddd@gmail.com' }
    password              { 'Ddd000' }
    password_confirmation { 'Ddd000' }
    first_name            { '熊山' }
    last_name             { '熊之助' }
    first_name_kana       { 'クマヤマ' }
    last_name_kana        { 'クマノスケ' }
    birth_date            { '2008-06-10' }
  end
end
