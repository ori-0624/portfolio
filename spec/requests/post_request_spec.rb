require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "withoug sign_in" do
    before do
      @post = create(:post)
      @user = @post.user
      @others_post = create(:post, :others_post)
      @other_user = @others_post.user
    end
    
    it "cant access new with sign_out" do
      get new_user_post_path(@user)
      expect(response.body).to redirect_to new_user_session_path
    end
    
    it "cant create with sign_out" do
      post user_post_index_path(@user)
      expect(response.body).to redirect_to new_user_session_path
    end
    
    it "cant destroy with sign_out" do
      delete user_post_path(@user, id: @post.id)
      expect(response.body).to redirect_to new_user_session_path
    end
  end
  
  describe "normarly" do
    before do
      @post = create(:post)
      @user = @post.user
      @others_post = create(:post, :others_post)
      @other_user = @others_post.user
      sign_in @user
    end
    
    it "should be create" do
      @post = Post.new(user_id: @user.id, content: "addTest")
      post user_post_index_path(@user, post: {content: @post.content})
      #DBに存在すること
      expect(Post.find_by(content: @post.content)).not_to eq nil
      #遷移先も正しいこと
      expect(response).to redirect_to root_path
    end
    
    it "should be destroy" do
      delete user_post_path(@user, @post)
      #DB上存在しないこと
      expect(Post.find_by(id: @post.id)).to eq nil
      #遷移先も正しいこと
      expect(response).to redirect_to root_path
    end
  end
  
  describe "of others" do
    before do
      @post = create(:post)
      @user = @post.user
      @others_post = create(:post, :others_post)
      @other_user = @others_post.user
      sign_in @user
    end
    
    it "cannot access others new_post" do
      get new_user_post_path(@other_user)
      expect(response.body).to redirect_to root_path
    end
    
    it "cannot create others post" do
      others_post = Post.new(user_id: @other_user.id, content: "dummy")
      post user_post_index_path(@other_user, post: {content: others_post.content})
      expect(response.body).to redirect_to root_path
    end
    
    it "cannot destroy others post" do
      delete user_post_path(@other_user, @others_post)
      expect(response.body).to redirect_to root_path
    end
  end

end
