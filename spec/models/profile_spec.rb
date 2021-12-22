require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'バリデーションのテスト' do
    context '紹介文が1001字以上の場合の場合' do
      it 'バリデーションにひっかかる' do
        profile = Profile.new(
          icon: open("./app/assets/images/profile1.jpg"),
          gender: "男性",
          birthday: "1994-09-02",
          residence: 1,
          golf_history: 6,
          average_score: 5,
          annual_round_time: 10,
          playable_date: 3,
          pick_up: 2,
          introduction: Faker::Lorem.characters(number:1001)
        )
        expect(profile).not_to be_valid
      end
    end
  end
end