require 'rails_helper'

describe Category, type: :model do

  subject do
    User.create(name: 'John Doe', email: 'johndoe@mail.com', password: 'password',
      password_confirmation: 'password')
  end

  before { subject.save }

  describe "validation" do
    
    it "should not have a valid name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    
    it "should have a valid name" do
      expect(subject.name).to eql('John Doe')
    end

    it "should validate email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "should validate password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "should create user successfully if all fields is supplied" do
      expect(subject).to be_valid
    end
  end
end