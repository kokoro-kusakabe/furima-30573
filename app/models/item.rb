class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  validates :image, :name, :description, :category, :status, :burden, :area, :day, :price, presence: true

  validates :category_id, :status_id, :burden_id, :area_id, :day_id, numericality: { other_than: 0 } 
  # validates :category_id, :status_id, :burden_id, :area_id, :day_id, numericality: { message: "select"}
  # validates :price format(with: )

  has_one_attached :image
  
  belongs_to :user
end