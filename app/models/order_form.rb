class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :order_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

  validates :postal_code, :prefecture_id, :city, :addresses, :phone_number, :user_id, :item_id, :token, presence: true
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                   building: building, phone_number: phone_number)
  end
end
