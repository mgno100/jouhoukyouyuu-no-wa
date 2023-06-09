require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
  end

  describe 'グループ作成' do
    context '新規作成できる場合' do
      it 'nameの値が存在すれば作成できる' do
        expect(@group).to be_valid
      end
      it 'introductionは空でも作成できる' do
        @group.introduction = nil
        expect(@group).to be_valid
      end
    end
    context '新規作成できない場合' do
      it 'nameが空では作成できない' do
        @group.name = ''
        @group.valid?
        expect(@group.errors.full_messages).to include('グループ名を入力してください')
      end
      it 'userが紐付いていないと投稿できない' do
        @group.user = nil
        @group.valid?
        expect(@group.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
