class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 必須項目：nickname、email、password、family_name、family_name_kana、first_name、first_name_kana、birthday     
  validates :nickname,               presence: true
  validates :email,     presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } # メールアドレスの正規表現 (メールアドレスは一意性であり、@を含む)
  validates :encrypted_password,     presence: true, length: { minimum: 7 } # 文字数の正規表現 (パスワードは、6文字以上で半角英数字混合での入力が必須。パスワードとパスワード（確認用）は、値の一致が必須)
  validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現 (全角（漢字・ひらがな・カタカナ）で入力)
  validates :family_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現(全角（カタカナ）で入力)
  validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現（名字と一緒）
  validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現（名字と一緒）
  validates :birthday,               presence: true
end
