class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        with_options presence: true do
          validates :nickname
          validates :birthday
          validates :name_first, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
          validates :name_last, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
          validates :name_reading_first, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
          validates :name_reading_last, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
        end
        validates :password, format: { with: /(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]/, message: "Include both letters and numbers" }
  
  has_many :items
end
