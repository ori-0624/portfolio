require 'rails_helper'

RSpec.describe User, type: :model do
  it 'unsuccess insert without name' do
    user = User.new do |u|
        u.email = "test@test.com"
        u.password = "password"
    end
    expect(user.save).to eq false
  end
  
  it 'success insert' do
    user = User.create do |u|
        u.email = "test@test_feature.com"
        u.name = "test"
        u.password = "password"
    end
    expect(user.save).to eq true
  end
end
