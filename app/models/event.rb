class Event < ApplicationRecord
  has_many :comments
  belongs_to :group
end
