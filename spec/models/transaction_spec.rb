require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject do
    @user = User.new(name: 'Himas', email: 'him@mail.com', password: '123456')
    @category = Category.new(author_id: @user.id, name: 'Food', icon: 'https://images.unsplash.com/photo-1553846830-8fb467fe2453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80')
    @transaction = Transaction.new(name: 'Burger', amount: 10, author_id: @user.id, categories_id: @category.id)
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
