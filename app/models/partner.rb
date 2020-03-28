class Partner < ApplicationRecord
  has_many :partner_staff

  validates :name, :country, :state, :city, :type, presence: true
  validates :email, uniqueness: true

  enum type: { "Corporation" => 0, "NGO" => 1, "Group" => 2, "Other" => 3 }
end
