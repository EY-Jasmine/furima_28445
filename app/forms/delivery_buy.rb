class DeliveryBuy

  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :address, :building, :tel, :item_id, :user_id, :buy_id, :token

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :tel, format: { with: /\A[0-9]+\z/ }
    validates :token
  end
  
  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Delivery.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel, buy_id: buy.id)
  end

end