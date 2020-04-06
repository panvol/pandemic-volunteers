class Volunteer < ApplicationRecord
  enum crew: {
    "aid crew" => 0,
    "elderly crew" => 1,
    "coordination crew" => 2,
    "research crew" => 3,
    "triage crew" => 4,
    "hospital crew" => 5,
    "other" => 6
  }

  validates :email, presence: true, format: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :phone, presence: true
  validates :name, :about, presence: true
  validates :email, uniqueness: true
end
