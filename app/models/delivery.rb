class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :item

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture
    validates :city
    validates :address
    validates :tel, format: { with: /\A[0-9]+\z/ }
    validates :item
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

end