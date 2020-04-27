# frozen_string_literal: true

class Volunteer < ApplicationRecord
  enum crew: {
    'Elderly Crews' => 1,
    'Coordination Crews' => 2,
    'Aid Crews' => 0,
    'Research Ambassadors' => 3,
    'Triage Crews' => 4,
    'Hospital Crews' => 5,
    'Other' => nil
  }

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[A-Z0-9._%a-z\-\+]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :phone, presence: true, format: /\A\+?[x\d\(\)\-\.\ ]{4,}\z/
  validates :about, presence: true
end
