require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '情報投稿' do
    context '情報が投稿できるとき' do
      it 'title、sentenceが存在すれば投稿できる' do
        expect(@post).to be_valid
      end
    end
    context '情報が投稿できないとき' do
      it 'titleが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('タイトル名を入力してください')
      end
      it 'sentenceが空では投稿できない' do
        @post.sentence = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('情報の内容文を入力してください')
      end
      it 'groupが紐付いていないと投稿できない' do
        @post.group = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('グループを入力してください')
      end
      it 'userが紐付いていないと投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
