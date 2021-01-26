require 'rails_helper'

RSpec.feature "PageTransitions", type: :feature do

  describe "index page transitions" do
    before do
      # 予めログイン画面からIndexページに遷移する
      @user = create(:user)
      
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_on 'commit'
    end

    it "from index to edit_registration" do
      expect(current_path).to eq user_index_path
      click_link 'edit'
      expect(current_path).to eq edit_user_registration_path+'.'+@user.id.to_s()
    end
  end
end
