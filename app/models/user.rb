class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # パスワードに英字と数字の両方を含める
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  # 名前（姓名）に全角文字以外を使えないようにする
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end
  # 名前（ふりがな）に全角カタカナ以外を使えないようにする
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください' } do
    validates :myoji_kana
    validates :namae_kana
  end 
  
end
