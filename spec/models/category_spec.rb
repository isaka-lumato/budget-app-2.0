require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    @user = User.new(name: 'Ray', email: 'hima@mail.com', password: '123456')
    @category = Category.new(author_id: @user.id, name: 'Food', icon: 'https://images.unsplash.com/photo-1553846830-8fb467fe2453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80')
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = @category.name
    expect(subject).to be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
