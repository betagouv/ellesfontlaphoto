class Contact < ApplicationRecord
  validates :email, presence: true
  validates :type, presence: true
end
