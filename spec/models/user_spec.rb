require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is valid with a first name,last name,email,and password" do
    user = User.new(first_name:"Aaron",last_name:"Summer",email:"tester@example.com",password:"password")
    expect(user).to be_valid
  end

  # it "is invalid without a first name" do
  #   # user = User.new(first_name:nil)
  #   user = FactoryBot.build(:user,first_name:nil)
  #   user.valid?
  #   expect(user.errors[:first_name]).to include("can't be blank")
  # end
  it{ is_expected.to validate_presence_of :first_name}

  # it "is invalid without a last name" do
  #   # user = User.new(last_name:nil)
  #   user = FactoryBot.build(:user,last_name:nil)
  #   user.valid?
  #   expect(user.errors[:last_name]).to include("can't be blank")
  # end
  it {is_expected.to validate_presence_of :last_name}

  # it "is invalid without a email address" do
  #   # user = User.new(email:nil)
  #   user = FactoryBot.build(:user,email:nil)
  #   user.valid?
  #   expect(user.errors[:email]).to include("can't be blank")
  # end
  it {is_expected.to validate_presence_of :email}

  # it "is invalid with a duplicate email address" do
  #   # User.create(first_name:"Joe",last_name:"Tester",email:"tester@example.com",password:"password")
  #   # user = User.new(first_name:"Jane",last_name:"Tester",email:"tester@example.com",password:"password")
  #   FactoryBot.create(:user,email:"aaron@example.com")
  #   user = FactoryBot.build(:user,email:"aaron@example.com")
  #   user.valid?
  #   expect(user.errors[:email]).to include("has already been taken")
  # end
  it {is_expected.to validate_uniqueness_of(:email).case_insensitive}

  it "returns a user's full name as a string" do
    # user = User.new(first_name:"John",last_name:"Doe",email:"password")
    user = FactoryBot.build(:user,first_name:"John",last_name:"Doe")
    expect(user.name).to eq "John Doe"
  end
end
