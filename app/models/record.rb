class Record < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping

  validates :token, presence: true
end
