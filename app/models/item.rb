class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :burden, :area, :day

  validates :, :name, :description, :category, :status, :burden, :area, :day, presence: true

  validates :category_id, :status_id, :burden_id, :area_id, :day_id, numericality: { other_than: 0 } 
end