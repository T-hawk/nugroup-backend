class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false

  has_and_belongs_to_many :group
end
