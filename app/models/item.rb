class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date
  
  with_options presence: true do 
    validates :image
    validates :item_name
    validates :appeal_point
    
    #選択肢「--」は保存できないようにする
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :shipping_date_id
    end
    #半角数字、¥300-¥9,999,999間のみ保存可能
    validates :price,format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  
end