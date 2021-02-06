require 'rails_helper'

def log_in
    @user = create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on 'commit'
end

RSpec.feature "PageTransitions", type: :feature do

  describe "index page transitions" do
    before do
      # 予めログイン画面からIndexページに遷移する
      log_in
    end

    it "from index to edit_registration" do
      expect(current_path).to eq root_path
    end
  end
  
  describe "header transitions" do
    
    it "header contains log_in_path at signout" do
      visit root_path
      click_link 'ログイン'
      expect(current_path).to eq new_user_session_path
    end
    
    it "header contains sign_up path at signout" do
      visit root_path
      click_link '新規登録'
      expect(current_path).to eq new_user_registration_path
    end
    
    it "header contains new_post at signin" do
      log_in
      pending('まだ実装してない')
      click_link '新規投稿'
      expect(current_path).to eq user_post_index_path
    end
    
    it "header contains profile_edit at signin" do
      log_in
      click_link 'プロフィール変更'
      expect(current_path).to eq edit_user_registration_path
    end
    
    it "header contains signout at signin" do
      log_in
      click_link 'ログアウト'
      expect(current_path).to eq root_path
    end
  end
end
