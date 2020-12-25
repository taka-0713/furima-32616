require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nicknameが存在すれば登録できること" do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空では登録できないこと" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailに@が含まれていないと登録できないこと" do
          @user.email = "aaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "重複したemailは登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空では登録できないこと" do
          @user.password = nil
          @user.password_confirmation = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordが5文字以下であれば登録できないこと" do
          @user.password = "abcde"
          @user.password_confirmation = "abcde"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is invalid") 
        end
        it "passwordが半角英字だけでは登録できないこと" do
          @user.password = "abcdef"
          @user.password_confirmation = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが半角数字だけでは登録できないこと" do
          @user.password = 123456
          @user.password_confirmation = 123456
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "last_name_kanjiが空では登録できないこと" do
          @user.last_name_kanji = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kanji can't be blank", "Last name kanji is invalid")
        end
        it "first_name_kanjiが空では登録できないこと" do
          @user.first_name_kanji = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kanji can't be blank", "First name kanji is invalid")
        end
        it "last_name_kanjiとfirst_name_kanjiは全角（漢字・ひらがな・カタカナ）でないと登録できないこと" do
          @user.last_name_kanji = "123abc"
          @user.first_name_kanji = "456def"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kanji is invalid", "First name kanji is invalid")
        end
        it "last_name_kanaが空では登録できないこと" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
        end
        it "first_name_kanaが空では登録できないこと" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
        end
        it "last_name_kanaとfirst_name_kanaは全角（カタカナ）でないと登録できないこと" do
          @user.last_name_kana = "大須賀"
          @user.first_name_kana = "たかふみ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid", "First name kana is invalid")
        end
        it "date_of_birthが空では登録できないこと" do
        @user.date_of_birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
        end
      
      end
    end
  end
end


