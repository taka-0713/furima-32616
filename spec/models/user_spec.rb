require 'rails_helper'

RSpec.describe User, type: :model do
  describe  do
  # describe '#create' do→#createは要るのか？
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nicknameが存在すれば登録できること" do
          expect(@user).to be_valid
        end
        it "emailが存在し、@があれば登録できること" do
          @user.email = "12@34"
          expect(@user).to be_valid
        end
        it "passwordとpassword_confirmationが存在し。6文字以上で半角英数字を含んでいれば登録できること" do
          @user.password = "123abc"
          @user.password_confirmation = "123abc"
          expect(@user).to be_valid 
        end
        it "last_name_kanjiとfirst_name_kanjiが存在し、全角(漢字、ひらがな、カタカナ)であれば登録できること" do
          @user.last_name_kanji = "大須賀"
          @user.first_name_kanji = "タカふみ"
          expect(@user).to be_valid
        end
        it "last_name_kanaとfirst_name_kanaは全角(カタカナ)であれば登録できること" do
          @user.last_name_kana = "オオスガ"
          @user.first_name_kana = "タカフミ"
          expect(@user).to be_valid
        end
        it "生年月日があれば登録できること" do
          @user.date_of_birth = "1999-05-05"
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
        it "passwordが半角英数字混合でないと登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
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
