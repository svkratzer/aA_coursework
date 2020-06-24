require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  # describe "associations" do
  # end

  # describe "User::find_by_credentials" do
  # end

  # describe "User::generate_session_token" do
  # end

end
