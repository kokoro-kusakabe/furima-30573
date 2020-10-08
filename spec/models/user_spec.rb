require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,name_first,name_last,name_reaading_first,name_reading_last,birthdayの全てが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "00Aki0"
        @user.password_confirmation = "00Aki0"
          expect(@user).to be_valid
      end
      it "passwordが半角英数混合であれば登録できる" do
        @user.password = "00Aki0"
        @user.password_confirmation = "00Aki0"
          expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれていないと登録できない" do
        @user.email = 'fafsf.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = '00aki'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが全角だと登録できない" do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが数字のみだと登録できない" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordがアルファベットのみだと登録できない" do
        @user.password = 'aaaAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "name_firstが空だと登録できない" do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank")
      end
      it "name_firstが半角だと登録できない" do
        @user.name_first = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first Full-width characters")
      end
      it "name_lastが空だと登録できない" do
        @user.name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last can't be blank")
      end
      it "name_lastが半角だと登録できない" do
        @user.name_first = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first Full-width characters")
      end
      it "name_reading_firstが空だと登録できない" do
        @user.name_reading_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name reading first can't be blank")
      end
      it "name_reading_firstが半角だと登録できない" do
        @user.name_reading_first = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name reading first Full-width katakana characters")
      end
      it "name_reading_lastが空だと登録できない" do
        @user.name_reading_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name reading last can't be blank")
      end
      it "name_reading_lastが半角だと登録できない" do
        @user.name_reading_last = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name reading last Full-width katakana characters")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
