class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :events
  validates :name, uniqueness: true

  before_create :gen_share_token

  private

  def gen_share_token
    self.share_token = loop do
      token = SecureRandom.urlsafe_base64(15)
      break token unless Group.exists?(share_token: token)
    end
  end
end
