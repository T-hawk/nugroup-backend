class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false

  has_and_belongs_to_many :groups
  has_many :comments

  validates :username, uniqueness: true

  before_create :gen_auth_token

  def User.validate_user(id:, auth_token:)
    user = find_by(id: id, auth_token: auth_token)
    raise "Invalid user credentials" if !user
    user
  end

  private

  def gen_auth_token
    self.auth_token = loop do
      token = SecureRandom.urlsafe_base64(15)
      break token unless User.exists?(auth_token: token)
    end
  end
end
