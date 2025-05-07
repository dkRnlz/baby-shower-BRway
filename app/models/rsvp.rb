class Rsvp < ApplicationRecord
  has_many :guests, inverse_of: :rsvp, dependent: :destroy
  accepts_nested_attributes_for :guests, allow_destroy: true, reject_if: ->(attrs){ attrs['name'].blank? }
  validates :name, :phone, presence: true
end
