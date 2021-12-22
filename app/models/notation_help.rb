class NotationHelp < ApplicationRecord
  has_one :help
  validates :help, uniqueness: true
end
