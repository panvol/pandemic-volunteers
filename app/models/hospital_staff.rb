class HospitalStaff < ApplicationRecord
  validates :name, :email, :hospital_id, presence: true
  validates :email, format: /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}/
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
