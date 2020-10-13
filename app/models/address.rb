class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  with_options presence: true do
    validates :postal_code, format{ with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/, message: "Input correctly"}
    validates :area_id, numericality: { other_than: 0 , message: "Select" }
    validates :city
    validates :house_number
    validates :phone_number, format{ with: /\A\d{10,11}\z/, message:"Input only number"}
  end
end
