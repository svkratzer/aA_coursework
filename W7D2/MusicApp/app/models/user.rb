class User < ApplicationRecord
  # has_secure_password
  validates :email, presence: true
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
 
  validates :password, length: { minimum: 6, allow_nil: true }
  # Allows the password to be either of length 6 or more (if we are 
  # creating a user from a form), or nil (if we've already created a user
  # and are just retrieving them from the database.)
  after_initialize :ensure_session_token 
  # This ensures that the user has a session_token 
  # before it's persisted to the database.
  attr_reader :password
  # we need an attr_reader for password, because it's technically called in 
  # the validates :password line. (That's how validates work.)

  def self.find_by_credentials(email, password)
    # Finds the user by their email. Sets user to that intance
    # of the User model, or nil, if no corresponding user is found.
    user = self.find_by(email: email)
    # Returns the user if the user is found, and the password is correct,
    # otherwise, returns nil.
    user.nil? && user.is_password(password) ? user : nil
  end

  def reset_session_token! 
    # Resets the session_token, irrespective of whether it exists.
    self.session_token = self.class.generate_session_token
  end

  def ensure_session_token
    # Uses lazy assignment to set a session_token if that users
    # session token is currently nil.
    self.session_token ||= self.class.generate_session_token
  end

  def password=(password)
    # Sets the password_digest to a hashed version of the plaintext
    # password that the user initially supplies in their HTTP request.

    # The password is initially stored as an instance variable so it can be validated
    # using attr_reader and validates :password above. 
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def is_password?(password)
    # Expands the User API to include a method that exists in the
    # BCrypt::Password API. Password#new converts our password_digest from
    # a string to a BCrypt object. We can then call Password#is_password on 
    # our 'Bcryptified' password.
    bcrypt_password = BCrypt::Password.new(self.password_digest)
    bcrypt_password.is_password?(password)
  end

  private

  def self.generate_session_token
    # By default this generates a random string, by default, of size
    # 16-bits. This will be used as a session_token.
    SecureRandom.urlsafe_base64
  end

end
