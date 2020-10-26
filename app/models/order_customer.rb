class OrderCustomer
    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id

  with_options presence: true do
        validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Postal code Input correctly"}
        validates :city
        validates :addresses
        validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Phone number Input only number"}
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "Prefecture Select" }

  def save
    # 購入情報の情報を保存し、「order」という変数に入れている
    order = Order.create(user_id: user.id, item_id: item.id)
    # 顧客の住所情報を保存
    Customer.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end
