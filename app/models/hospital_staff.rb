class HospitalStaff < ApplicationRecord
  validates :name, :email, :hospital_id, presence: true
  validates :email, format: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email, uniqueness: true
  validate :hospital_exists?

  def hospital_exists?
    begin
      hospital = Hospital.find(hospital_id)
    rescue ActiveRecord::RecordNotFound
      errors.add(:hospital_id, 'Hospital does not exist')
    end
  end
end
