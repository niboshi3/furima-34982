class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,               presence: true
  validates :email,     presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } # メールアドレスの正規表現
  validates :encrypted_password,     presence: true, length: { minimum: 7 } # 文字数の正規表現
  validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
  validates :family_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
  validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
  validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
  validates :birthday,               presence: true
end
