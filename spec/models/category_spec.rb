require 'rails_helper'

describe Category, type: :model do
  @user = User.create(name: 'John Doe', email: 'johndoe@mail.com', password: 'password',
                      password_confirmation: 'password')

  subject do
    Category.new(user: @user, name: 'Food', icon: 'https://images.unsplash.com/photo-1')
  end

  before { subject.save }

  describe 'validation' do
    it 'should have a valid name' do
      expect(subject.name).to eql('Food')
    end

    it 'should not have a valid name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should validate icon property' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end
end
