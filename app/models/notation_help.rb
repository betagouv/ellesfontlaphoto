class NotationHelp < ApplicationRecord
  belongs_to :help
  validates :help, uniqueness: true
end
