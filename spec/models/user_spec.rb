require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    
    it 'will be valid if password and password confimration match' do
      
      user = User.new(
        name: "Jan Doe",
        email: "j@test.com",
        password: "testtest",
        password_confirmation: "testtest"
        )
      expect(user).to be_valid
    end

    it 'will not be valid if password and password confimration match' do
      user = User.new(
        name: "Jan Doe",
        email: "j@test.com",
        password: "test",
        password_confirmation: "Test"
        )
      expect(user).to be_invalid
    end

    it 'will return invalid with no name' do
      user = User.new(
        name: nil,
        email: "j@test.com",
        password: "testtest",
        password_confirmation: "testtest"
        )
      expect(user).to be_invalid
    end

    it 'will be invalid with no email' do
      user = User.new(
        name: "Jan Doe",
        email: nil,
        password: "test",
        password_confirmation: "Test"
        )
      expect(user).to be_invalid
    end


    it 'will be invalid with two emails that are the same' do
      User.create(
        name: "Jan Doe",
        email: 'TEST@TEST.COM',
        password: "testtest",
        password_confirmation: "testtest"
        )
      user = User.new(
        name: "Jan Doe",
        email: 'test@test.com',
        password: "testtest",
        password_confirmation: "testtest"
        )
      expect(user).to be_invalid
    end


    it 'will return invalid with password length less then 6' do
      user = User.new(
        name: "Jane",
        email: "j@test.com",
        password: "test",
        password_confirmation: "test"
        )
      expect(user).to be_invalid
    end
  end


  
  describe '.authenticate_with_credentials' do
    it 'will return user if user is valid' do
      user = User.create(
        name: "Jane",
        email: "j@test.com",
        password: "testtest",
        password_confirmation: "testtest"
        )

        authenticated_user = User.authenticate_with_credentials("j@test.com", "testtest")
        expect(authenticated_user).to eq(user)
  end


 
    it 'will return user if user even with spaces in email' do
      user = User.create(
        name: "Jane",
        email: "j@test.com",
        password: "testtest",
        password_confirmation: "testtest"
        )

        authenticated_user = User.authenticate_with_credentials("   j@test.com", "testtest")
        expect(authenticated_user).to eq(user)
  end

  it 'will return user if user even with uppercase in email' do
    user = User.create(
      name: "Jane",
      email: "j@test.com",
      password: "testtest",
      password_confirmation: "testtest"
      )

      authenticated_user = User.authenticate_with_credentials("J@teSt.com", "testtest")
      expect(authenticated_user).to eq(user)
end


  it 'will return nil if user is invalid' do
    user = User.create(
      name: "Jane",
      email: nil,
      password: "testtest",
      password_confirmation: "testtest"
      )

      authenticated_user = User.authenticate_with_credentials("j@test.com", "testtest")
      expect(authenticated_user).to eq(nil)
end

end
end
