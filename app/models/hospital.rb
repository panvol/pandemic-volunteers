class Hospital < ApplicationRecord
  validates :name, :country, presence: true
end
