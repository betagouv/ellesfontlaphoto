class Contact < ApplicationRecord
  attr_accessor :email
  validates :contact_email, uniqueness: true, if: -> { contact_type == 'newsletter' }
  validates :comment, presence: true, if: -> { contact_type != 'newsletter' }
  validates :accept_cgu, presence: true
end
