require 'rails_helper'

describe Transact, type: :model do
  @user = User.create(name: 'John Doe', email: 'johndoe@mail.com', password: 'password',
    password_confirmation: 'password')

  subject do
    Transact.new(user: @user, name: 'Pizza', amount: 200)
  end

  before { subject.save }

  describe "validation" do
    it "should have a valid name" do
      expect(subject.name).to eql('Pizza')
    end

    it "should not have a valid name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "should validate amount" do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it "should validate amount to be greater or equal to 0" do
      subject.amount = -1
      expect(subject).to_not be_valid
    end

    it "should validate amount to be numeric only" do
      subject.amount = '12'
      expect(subject).to_not be_valid
    end
  end
end