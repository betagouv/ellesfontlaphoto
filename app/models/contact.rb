class Contact < ApplicationRecord
  validates :email, presence: true
  validates :contact_type, presence: true
end
