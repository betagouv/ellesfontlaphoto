class NotificationHelp < ApplicationRecord
  belongs_to :help
  validates :email, presence: true, uniqueness: { scope: :help }
  validates :email, format: { with: /\A\S+@.+\.\S+\z/ }
  validates :accept_cgu, presence: true
end
