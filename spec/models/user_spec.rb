require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = User.new(nickname: '', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                      family_name: 'あああ', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できない' do
      user = User.new(nickname: 'kkk', email: '', password: '00000000a', password_confirmation: '00000000a',
                      family_name: 'あああ', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '', password_confirmation: '',
                      family_name: 'あああ', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_nameが空だと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                      family_name: '', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空だと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                      family_name: 'あああ', first_name: '', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'myoji_kanaが空だと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                      family_name: 'あああ', first_name: 'いいい', myoji_kana: '', namae_kana: 'イイイ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Myoji kana can't be blank")
    end
    it 'namae_kanaが空だと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                      family_name: 'あああ', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: '', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Namae kana can't be blank")
    end
    it 'birthdayが空だと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                      family_name: 'あああ', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'family_nameは全角でないと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                      family_name: 'aaa', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include('Family name 全角文字を使用してください')
    end
    it 'first_nameが全角でないと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                      family_name: 'あああ', first_name: 'iii', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include('First name 全角文字を使用してください')
    end
    it 'myoji_kanaは全角カタカナでないと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                      family_name: 'あああ', first_name: 'いいい', myoji_kana: 'aaa', namae_kana: 'イイイ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include('Myoji kana 全角文字を使用してください')
    end
    it 'namae_kanaは全角カタカナでないと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                      family_name: 'あああ', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: 'iii', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include('Namae kana 全角文字を使用してください')
    end

    it 'nicknameとemailはそれぞれ同じ内容を２件以上登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                      family_name: 'あああ', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '1930-01-01')
      another_user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '00000000a',
                              family_name: 'あああ', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '1930-01-01')
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordとpassword_confirmationが同じでないと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000a', password_confirmation: '',
                      family_name: 'あああ', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとには英字と数字を入れないと登録できない' do
      user = User.new(nickname: 'kkk', email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000',
                      family_name: 'あああ', first_name: 'いいい', myoji_kana: 'アアア', namae_kana: 'イイイ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
  end
end
