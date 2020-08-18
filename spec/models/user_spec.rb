require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname、email、passwordとpassword_confirmation、family_nameとfirst_name、myoji_kanaとnamae_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
      it 'family_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.family_name = '阿あア'
        expect(@user).to be_valid
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.first_name = '井いイ'
        expect(@user).to be_valid
      end
      it 'myoji_kanaは全角カタカナであれば登録できる' do
        @user.myoji_kana = 'アアア'
        expect(@user).to be_valid
      end
      it 'namae_kanaは全角カタカナであれば登録できる' do
        @user.namae_kana = 'イイイ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が存在しない場合登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合でないと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが半角では登録できない' do
        @user.family_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'myoji_kanaが半角では登録できない' do
        @user.myoji_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Myoji kana is invalid')
      end
      it 'namae_kanaが半角では登録できない' do
        @user.namae_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Namae kana is invalid')
      end
      it 'myoji_kanaが空では登録できない' do
        @user.myoji_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Myoji kana can't be blank")
      end
      it 'namae_kanaが空では登録できない' do
        @user.namae_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Namae kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
