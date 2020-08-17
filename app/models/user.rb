class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 全カラム空欄を禁止
  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :myoji_kana, presence: true
  validates :namae_kana, presence: true
  validates :birthday, presence: true

  # ニックネームとメールアドレスを一意性に
  validates :nickname, uniqueness: true
  validates :email, uniqueness: true

  # １つめのパスワードと確認用のパスワードが同じか
  validates :password, confirmation: true

  # パスワードに英字と数字の両方を含める
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  # 名前（姓名）に全角文字以外を使えないようにする
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end
  # 名前（ふりがな）に全角カタカナ以外を使えないようにする
  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください' } do
    validates :myoji_kana
    validates :namae_kana
  end 

end
