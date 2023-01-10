class Contact < ApplicationRecord
  validates :contact_email, format: { with: /\A\S+@.+\.\S+\z/ }
  validates :contact_email, uniqueness: true, if: -> { contact_type == 'newsletter' }
  validates :comment, presence: true, if: -> { contact_type != 'newsletter' }
  validates :accept_cgu, presence: true
  validates :contact_email, presence: true
end
