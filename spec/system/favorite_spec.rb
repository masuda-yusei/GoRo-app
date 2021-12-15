require 'rails_helper'

RSpec.describe "Favorite", type: :system do

  describe 'ゴルファーのお気に入り機能' do
    before do
      @user1 = FactoryBot.create(:user)
      profile = @user1.build_profile(id: @user1.id)
      profile.save!
      @user2 = FactoryBot.create(:second_user)
      profile = @user2.build_profile(id: @user2.id)
      profile.save!
      visit new_user_session_path
      fill_in :user_email, with: 'general@ex.com'
      fill_in :user_password, with: 'password'
      click_button "ログイン"
    end

    let!(:user1) { FactoryBot.create(:user, user_id: @user1.id) }
    let!(:user2) { FactoryBot.create(:second_user, user_id: @user2.id) }

    context 'ゴルファーをお気に入りした場合' do
      it 'お気に入り登録され、ボタンが「お気に入り解除」に変わる' do
        visit user_path(user2.id)
        click_on "お気に入りする"
        expect(page).to have_content 'Admin Userさんをお気に入りしました'
        expect(page).to have_content 'お気に入り解除'
      end
    end

    context 'お気に入りを解除した場合' do
      it 'お気に入りが解除され、ボタンが「お気に入りする」に変わる' do
        visit user_path(usesr2.id)
        click_on "お気に入りする"
        click_on "お気に入り解除"
        expect(page).to have_content 'Admin Userさんをお気に入りから解除しました'
        expect(page).to have_content 'お気に入りする'
      end
    end

    context '自分の投稿にアクセスした場合' do
      it 'お気に入りがボタンが表示されない' do
        visit trip_path(user1.id)
        expect(page).not_to have_button 'お気に入りする'
      end
    end

  end
end 