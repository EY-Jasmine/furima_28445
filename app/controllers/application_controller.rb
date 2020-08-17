class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:myoji_kana])
    devise_parameter_sanitizer.permit(:account_update, keys: [:myoji_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:namae_kana])
    devise_parameter_sanitizer.permit(:account_update, keys: [:namae_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:birthday])
  end

end
