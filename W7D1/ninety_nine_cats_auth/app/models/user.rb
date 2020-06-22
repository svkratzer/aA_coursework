# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true}


    attr_reader :password

    def password=(plaintext_password)
        @password = plaintext_password
        self.password_digest = BCrypt::Password.create(@password)
    end
    def is_password?(password)
        bc_password = BCrypt::Password.new(self.password_digest)
        bc_password.is_password?(password)
    end
    
    def reset_session_token!
        self.session_token = generate_session_token
        self.save!
        self.session_token
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user && user.is_password?(password)
        user
    end

    private
    def generate_session_token
        SecureRandom::urlsafe_base64
    end
end
