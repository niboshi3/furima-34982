class User < ApplicationRecord
  has_many :items
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション内容の認識がしやすいようにコメント記載
  # 必須項目：nickname、email、password、family_name、family_name_kana、first_name、first_name_kana、birthday
  with_options presence: true do 
    validates :nickname
    validates :birthday               
    # ユーザー本名全角の正規表現 (全角（漢字・ひらがな・カタカナ）で入力)
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :family_name 
      validates :first_name
    end
    # フリガナ全角の正規表現(全角（カタカナ）で入力)
    with_options format:  {with: /\A[ァ-ヶー－]+\z/} do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
  # メールアドレスの正規表現 (メールアドレスは一意性であり、@を含む)
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i} 
  # パスワードの半角英数のみ混合の正規表現
  validates :password, format: {with: /(?=.*[a-z])(?=.*\d)[a-z\d]{6,}/i}

end

