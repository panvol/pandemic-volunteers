class Partner < ApplicationRecord
  has_many :partner_staff

  validates :name, :country, :state, :city, :partner_type, presence: true

  enum partner_type: { "Corporation" => 0, "NGO" => 1, "Group" => 2, "Other" => 3 }
end
