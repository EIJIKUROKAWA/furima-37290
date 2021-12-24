class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence:true
  validates :email, uniqueness: true
  validates :encrypted_password, presence:true, length: { minimum: 6 }
  validates :name_kanji_last, presence:true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :name_kanji_first, presence:true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :name_kana_last, presence:true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :name_kana_first, presence:true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth, presence:true        
end
