class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence:true
  validates :email, uniqueness: true
  validates :encrypted_password, presence:true
  validates :name_kanji_last, presence:true
  validates :name_kanji_first, presence:true
  validates :name_kana_last, presence:true
  validates :name_kana_first, presence:true
  validates :birth, presence:true        
end
