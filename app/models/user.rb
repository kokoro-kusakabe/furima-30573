class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
        #  validates :nickname, :name_first, :name_last, :name_reading_first, :name_reading_last, :birthday, presence: true
        #  validates :nickname, presence: { message: "Nickname can't be blank" }
        #  validates :nickname, presence: true, { message: "Nickname can't be blank" }
        #  validates :email, presence: { message: "Email can't be blank" }
        #  validates :password, presence: { message: "Password can't be blank" }
        #  validates :name_first, presence: { message: "First name can't be blank" }
        #  validates :name_last, presence: { message: "Last name can't be blank" }
        #  validates :name_reading_first, presence: { message: "First name kana can't be blank" }
        #  validates :name_reading_last, presence: { message: "Last name kana can't be blank" }
        #  validates :birthday, presence: { message: "Birth date can't be blank" }

        #  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
        #  validates :password, confirmation: { message: "Password Include both letters and numbers" }
        #  validates :name_first, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "First name Full-width characters"}
        #  validates :name_last, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Last name Full-width characters"}
        #  validates :name_reading_first, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana Full-width katakana characters"}
        #  validates :name_reading_last, format: { with: /\A[ァ-ヶー－]+\z/, message: "Last name kana Full-width katakana characters"}
        
        # validates :nickname, :birthday, presence: true

        with_options presence: true do
          validates :nickname
          validates :birthday
          validates :name_first, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
          validates :name_last, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
          validates :name_reading_first, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
          validates :name_reading_last, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
        end
        #validates :password, format: { with: /\A[a-z0-9]+\z/i }
        validates :password, format: { with: /(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]/, message: "Include both letters and numbers" }
        #validates :password_confirmation, confirmation: { message: "Password Include both letters and numbers" }
end
