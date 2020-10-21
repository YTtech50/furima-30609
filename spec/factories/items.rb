FactoryBot.define do
  factory :item do
    item_name   { '良い品物Goods' }
    item_info    { 'これは大変貴重なGoodsです' }
    item_category_id   { '8' }
    item_sales_status_id   { '2' }
    item_shipping_fee_status_id   { '3' }
    item_prefecture_id   { '32' }
    item_scheduled_delivery_id   { '4' }
    item_price   { '123456' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
