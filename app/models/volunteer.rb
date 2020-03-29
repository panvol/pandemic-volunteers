class Volunteer < ApplicationRecord
  enum groups: {
    "hospital" => "help nurses in hospitals",
    "triage" => "visit patients in home isolation",
    "healthcare" => "give care to dependents of healthcare workers",
    "elderly" => "cater to the needs of the elderly",
    "research" => "curate academic research for busy doctors",
    "operations" => "operations",
    "other" => "other"
  }

  validates :email, presence: true, format: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :phone, presence: true, format: /\A\+?[\d\(\)\-\ ]{7,}\z/
  validates :name, :about, presence: true
  validates :email, uniqueness: true
end
