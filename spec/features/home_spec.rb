require 'rails_helper'
require 'devise'

RSpec.describe "Home", type: :feature do
  describe "paging" do
    before do
      @posts = create_list(:post, 101)
      @user = @posts[0].user
      sign_in @user
      visit root_path
    end
    
    it "paging should exists" do
      expect(page).to have_selector '.page-item'
    end
    
    it "paging contains 25 posts" do
      expect(page.all('.post_content').size).to eq 25
    end
    
    it "paging links" do
      page.all('.page-item')[1].click
      expect(page).to have_selector '.post_content'
    end
    
    #after do
    #  ActiveRecord::Base.connection.execute "DELETE FROM POSTS;"
    #  ActiveRecord::Base.connection.execute "DELETE FROM USERS;"
    #  ActiveRecord::Base.connection.execute "COMMIT;"
    #end

  end
  
  describe "destroy link" , js: true do
    before do
      @posts = create_list(:post, 101)
      @user = @posts[0].user
      sign_in @user
      visit root_path
    end
    
    it "do with ok in confirm" do
      all('.post_button_destroy')[0].click
      expect {
        expect(page.accept_confirm).to eq "投稿を削除しますか？"
        expect(page).to have_content "投稿を削除しました"
      }.to change(@user.posts, :count).by(-1)
    end
    
  end

end

