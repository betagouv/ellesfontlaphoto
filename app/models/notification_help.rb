class NotificationHelp < ApplicationRecord
  belongs_to :help
  validates :email, uniqueness: { scope: :help }
end
