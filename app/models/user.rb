class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 全カラム空欄を禁止
  # ニックネームとメールアドレスを一意性に
  # １つめのパスワードと確認用のパスワードが同じか
  # パスワードに英字と数字の両方を含める
  # 名前（姓名）に全角文字以外を使えないようにする
  # 名前（ふりがな）に全角カタカナ以外を使えないようにする
  with_options presence: true do  
    validates :nickname, uniqueness: true
    validates :birthday

    with_options format: {with: /\A[ぁ-んァ-ン一-龥]+\z/} do
      validates :family_name
      validates :first_name
    end

    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :myoji_kana
      validates :namae_kana
    end
  end

  validates :email, uniqueness: true
  validates :password, confirmation: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

end