require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できるとき' do
      it 'contentが存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントが投稿できないとき' do
      it 'contentが空では投稿できない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントを入力してください')
      end
      it 'postが紐付いていないと投稿できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメント先の情報を入力してください')
      end
      it 'userが紐付いていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
