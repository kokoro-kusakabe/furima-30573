class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 0 , message: "Select" }
    validates :status_id, numericality: { other_than: 0 , message: "Select" }
    validates :burden_id, numericality: { other_than: 0 , message: "Select" }
    validates :area_id, numericality: { other_than: 0 , message: "Select" }
    validates :day_id, numericality: { other_than: 0 , message: "Select" }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  end
  validates :price, format: { with: /\A[0-9]+\z/ , message: "Half-width number"}

  has_one_attached :image
  
  belongs_to :user

end