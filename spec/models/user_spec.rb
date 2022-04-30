require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Hima', email: 'hima@mail.com', password: '123456') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = 'Hima'
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
