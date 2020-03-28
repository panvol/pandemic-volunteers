class Hospital < ApplicationRecord
  validates :name, :country, :city, presence: true
  validates :state, presence: true, if: :country_with_states?

  COUNTRIES_WITH_STATES = [ 'United States' ]
  
  def country_with_states?
    COUNTRIES_WITH_STATES.include?(country)
  end
end
