class OrderForm
  include ActiveModel::Model

  attr_accessor :token, :postal_code, :area_id, :city, :house_number, :phone_number, :building_name, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/, message: "Input correctly" }
    validates :area_id, numericality: { other_than: 0 , message: "Select" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Input only number" }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end


end