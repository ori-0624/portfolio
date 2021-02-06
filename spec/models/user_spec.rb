require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name is required' do
    user = build(:user, name: nil)
    expect(user.save).to eq false
  end
  
  it 'success insert' do
    user = build(:user)
    expect(user.save).to eq true
  end
end
