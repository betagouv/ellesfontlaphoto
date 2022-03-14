class Review < ApplicationRecord
  belongs_to :help
  validates :comment, presence: true
end
