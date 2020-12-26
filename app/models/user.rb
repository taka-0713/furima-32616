class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true do
   validates :nickname
   validates :date_of_birth
  end
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }  do
    validates :last_name_kanji 
    validates :first_name_kanji
  end  
  
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end

  has_many :items
  
end
