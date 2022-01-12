require 'rails_helper'

RSpec.describe User, type: :model do
  
  # name:
  # email:
  # password:
  # password_confirmation:


  # @user = User.create(
  #       name: "Bob", 
  #       email: 'bob@bob.com',
  #       password: '123', 
  #       password_confirmation: '123'
  #     )
  #       expect(@user).to be_falsey



  describe 'Validations' do
    
    it 'should save with all fields filled out of the form' do
      
    end

    it 'is not valid if the first name is missing' do
      
    end

    it 'is not valid if the last name is missing' do
      
    end

    it 'is not valid if the email is missing' do
      
    end

    it 'is not valid if the password is missing' do
      
    end

    it 'is not valid if the password and password confirmation do not match' do
      
    end

  end

end
