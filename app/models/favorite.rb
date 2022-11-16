class Favorite < ApplicationRecord
  belongs_to :user
  validates :country, :recipe_title, :recipe_link, presence: true
end
