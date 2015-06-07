require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#favoriting?' do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }
    before do
      user1.favorite_users << user2
    end
    context 'ユーザーとお気に入り作成済みの場合' do
      it 'user1 は user2 をお気に入りしている' do
        expect(user1.favoriting?(user2)).to eq true
      end
      it 'user2 は user1 をお気に入りしていない' do
        expect(user2.favoriting?(user1)).to eq false
      end
      it 'user2 は user1 に気に入られている' do
        expect(user2.favorited_users).to include user1
      end
    end
  end
end
