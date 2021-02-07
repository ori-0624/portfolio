require 'rails_helper'
require 'devise'

RSpec.describe "Home", type: :feature do
  describe "paging" do
    before do
      @user = create(:user)
      @posts = create_list(:post, 101)
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
  end

end

