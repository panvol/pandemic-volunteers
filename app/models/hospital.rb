# frozen_string_literal: true

class Hospital < ApplicationRecord
  validates :name, :country, presence: true
end
