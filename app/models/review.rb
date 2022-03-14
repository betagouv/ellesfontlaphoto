class Review < ApplicationRecord
  belongs_to :help
  validates :comment, presence: true
  validates_length_of :comment, minimum: 3, maximum: 300
end
