class User < ActiveRecord::Base
  attr_reader :password
  after_initialize :ensure_session_token

  validates :name, :email,:password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, :name, :email, uniqueness: true
  has_many :upvotes
  has_many :questions

  def self.find_by_credentials(email, password)
    user=User.find_by(email: email)
    user.try(:is_password?, password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token  ||= self.class.generate_session_token
  end

  def self.from_omniauth(auth)
    where(uid: auth['uid'], provider: auth['provider']).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.name = auth['info']['nickname']
      user.email = auth['info']['email'] || 'email'
      user.uid = auth['uid']
      user.provider = auth['provider']
      user.password = auth['credentials']['secret']
    end
  end

end
