class Contact < ApplicationRecord
  attr_accessor :email
  validates :contact_email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Adresse e-mail au mauvais format"}
  validates :contact_type, presence: true
  validates :accept_cgu, presence: true
end
