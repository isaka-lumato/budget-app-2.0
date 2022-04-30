class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :name, :amount, presence: true
end
