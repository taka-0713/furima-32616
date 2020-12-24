class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX

  validates :nickname,          presence: true
  
  validates :last_name_kanji,   presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }  
  validates :first_name_kanji,  presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }  
  validates :last_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }  
  validates :first_name_kana,   presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }  
  
  validates :date_of_birth,     presence: true

end


# 以下試し用コード

# with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    # 処理が共通のものはまとめてこの中に記載できる
# end

