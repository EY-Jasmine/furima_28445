class Item < ApplicationRecord
  belongs_to :user

  # 全カラム空欄を禁止
  with_options presence: true do  
    validates :name
    validates :detail
    validates :category
    validates :condition
    validates :delivery_fee
    validates :prefecture
    validates :day
    validates :price
    validates :user

end