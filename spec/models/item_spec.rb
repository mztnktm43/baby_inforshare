require 'rails_helper'

# RSpec.describe Item, type: :model do
# end
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test.jpeg')
  end

  describe 'Item投稿' do
    context '投稿がうまくいくとき' do
      it 'image, name, detail, category_idが存在していれば投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'imageが空のとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空のとき' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが51文字以上のとき' do
        @item.name = Faker::Lorem.characters(number: 51)
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 50 characters)")
      end
      it 'detailが空のとき' do
        @item.detail = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'detailが1001文字以上のとき' do
        @item.detail = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail is too long (maximum is 1000 characters)")
      end
      it 'category_idが空のとき' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idがid:1{--}のとき' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'userが紐づいていないとき' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end