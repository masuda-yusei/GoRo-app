require 'rails_helper'

RSpec.describe Profile, type: :system do

  describe 'ユーザープロフィールのテスト' do
    before do
      @user1 = FactoryBot.create(:user)
      @profile1 = @user1.build_profile(id: @user1.id)
      @profile1.save!
      @user2 = FactoryBot.create(:second_user)
      @profile2 = @user2.build_profile(id: @user2.id)
      @profile2.save!
      visit new_user_session_path
      fill_in :user_email, with: 'general@ex.com'
      fill_in :user_password, with: 'password'
      click_button "ログイン"
    end

    context '一覧画面に遷移した場合' do
      it 'ユーザーのプロフィールが一覧で表示される' do
       visit profiles_path
       expect(page).to have_content 'General User'
       expect(page).to have_content 'Admin User'
      end
    end
    context '自分のプロフィールページにアクセスした場合' do
      it 'Editリンクは出るけど、Deleteのリンクは表示されない' do
        visit profile_path(@profile1.id)
        expect(page).to have_link '編集'
        expect(page).not_to have_link 'Delete'
      end
    end
    
    context '他人のプロフィールページにアクセスした場合' do
      it 'Edit,Deleteのリンクが表示されない' do
        visit profile_path(@profile2.id)
        expect(page).not_to have_link '編集'
        expect(page).not_to have_link 'Delete'
      end
    end
    context '他人のプロフィール編集ページにアクセスした場合' do
      it 'エラーメッセージが出て、アクセスできない' do
        visit edit_profile_path(@profile2.id)
        expect(page).to have_content 'ユーザー本人以外は編集できません'
      end
    end
  end
end 