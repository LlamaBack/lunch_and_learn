class User < ApplicationRecord
  validates :name, :email, :api_key, presence: true
  validates_uniqueness_of :email
  validates_uniqueness_of :api_key
end
