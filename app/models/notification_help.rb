class NotificationHelp < ApplicationRecord
  belongs_to :help
  validates :email, presence: true, uniqueness: { scope: :help }
end
