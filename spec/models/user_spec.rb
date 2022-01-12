require 'rails_helper'

RSpec.describe User, type: :model do

  # @user = User.create(
  #       name: "Bob", 
  #       email: 'bob@bob.com',
  #       password: '123', 
  #       password_confirmation: '123'
  #     )
  #       expect(@user).to be_falsey


  describe 'Validations' do
    
    it 'should save with all fields filled out of the form' do
      @user = User.new(
        first_name: 'Bob',
        last_name: 'Smith',
        email: 'bob@bob.com',
        password: '123', 
        password_confirmation: '123'
      )
      expect(@user).to be_valid
    end

    it 'is not valid if the first name is missing' do
      @user = User.new(
        first_name: nil,
        last_name: 'Smith',
        email: 'bob@bob.com',
        password: '123', 
        password_confirmation: '123'
      )
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid if the last name is missing' do
      @user = User.new(
        first_name: 'Bob',
        last_name: nil,
        email: 'bob@bob.com',
        password: '123', 
        password_confirmation: '123'
      )
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is not valid if the email is missing' do
      @user = User.new(
        first_name: 'Bob',
        last_name: 'Smith',
        email: nil,
        password: '123', 
        password_confirmation: '123'
      )
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid if the password is missing' do
      @user = User.new(
        first_name: 'Bob',
        last_name: 'Smith',
        email: 'bob@bob.com',
        password: nil, 
        password_confirmation: '123'
      )
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid if the password and password confirmation do not match' do
      @user = User.new(
        first_name: 'Bob',
        last_name: 'Smith',
        email: 'bob@bob.com',
        password: 'apple', 
        password_confirmation: 'apple'
      )
      @user2 = User.new(
        first_name: 'Ellen',
        last_name: 'Alex',
        email: 'ellen@ellen.com',
        password: 'salad', 
        password_confirmation: 'SALAD'
      )
      expect(@user.password).to eq(@user.password_confirmation)
      expect(@user2.password).to_not eq(@user2.password_confirmation)
    end

    it 'is not valid if the email is not unique' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Smith',
        email: 'bob@bob.com',
        password: 'apple', 
        password_confirmation: 'apple'
      )
      @user2 = User.create(
        first_name: 'Bobby',
        last_name: 'Alex',
        email: 'bob@bob.com',
        password: 'apple', 
        password_confirmation: 'apple'
      )
      expect(@user2).to be_invalid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'is not valid if the password does not meet minimum length' do
      @user = User.new(
        first_name: 'Bob',
        last_name: 'Smith',
        email: 'bob@bob.com',
        password: 'a', 
        password_confirmation: 'a'
      )
      @user2 = User.new(
        first_name: 'Bobby',
        last_name: 'Alex',
        email: 'bob@bob.com',
        password: 'apple', 
        password_confirmation: 'apple'
      )
      expect(@user).to be_invalid
      expect(@user2).to be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end

  end

end
