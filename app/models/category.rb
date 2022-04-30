class Category < ApplicationRecord
  validates :name, :icon, presence: true
end
