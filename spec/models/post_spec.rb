require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    create(:user)
  end
  
  it 'sort by created_at desc' do
    create(:post)
    newest_post = create(:post, :newest_post)
    posts = Post.all
    expect(posts[0]).to eq newest_post
  end
  
  it 'user_id should not be nil' do
    user_id_is_nil = build(:post, :user_id_is_nil)
    expect(user_id_is_nil.save).to eq false
  end
  
  it 'content should not be nil' do
    content_is_nil = build(:post, :content_is_nil)
    expect(content_is_nil.save).to eq false
  end
  
  it 'content should be under 300 bytes' do
    content_is_eq_to_maxlength = build(:post, :content_is_eq_to_maxlength )
    content_is_over_maxlength = build(:post, :content_is_over_maxlength )
    expect(content_is_eq_to_maxlength.save).to eq true
    expect(content_is_over_maxlength.save).to eq false
  end
end
