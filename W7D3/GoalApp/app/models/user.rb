class User < ApplicationRecord
  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, :session_token, uniqueness: true

  attr_reader :password

  after_initialize :ensure_session_token
  
  #A_FIG_VAPER

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user && user.is_password?(password)
      user
    else
      nil
    end
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token #implicit/explicit?
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token #implicit/explicit?
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  private

  def self.generate_session_token
    token = SecureRandom.urlsafe_base64
  end

end