require 'rails_helper'

# RSpec.describe Comment, type: :model do
  describe Comment do
    before do
      @comment = FactoryBot.build(:comment)
    end

    describe 'commentの投稿' do
      context 'comment投稿がうまくいくとき' do
        it 'commentが存在していれば投稿できる' do
          expect(@comment).to be_valid
        end
      end

      context 'comment投稿がうまくいかないとき' do
        it 'commentが空のとき' do
          @comment.comment = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Commentを入力してください")
        end
        it 'commentが1001文字以上あるとき' do
          @comment.comment = Faker::Lorem.characters(number: 1001)
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Commentは1000文字以内で入力してください")  
        end
        it 'userが紐づいていないとき' do
          @comment.user = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Userを入力してください")  
        end
        it 'itemが紐づいていないとき' do
          @comment.item = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Itemを入力してください")  
        end
      end
    end
end
