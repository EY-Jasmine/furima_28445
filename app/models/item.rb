class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  belongs_to :user
  has_one_attached :image

  #空の投稿を保存できないようにする
  with_options presence: true do  
    validates :name
    validates :detail
    validates :category
    validates :condition
    validates :delivery_fee
    validates :prefecture
    validates :day
    validates :price, numericality: {
      only_integer: true, :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999
      }
    validates :user
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :day_id
  end

end