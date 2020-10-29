FactoryBot.define do
  factory :order_customer do
    postal_code   { '123-4567' }
    prefecture_id { '10' }
    city { '横浜市南区' }
    addresses { '青山1-1-1' }
    building { '熊山ビル303' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
