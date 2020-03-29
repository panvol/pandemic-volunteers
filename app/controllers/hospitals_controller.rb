class HospitalsController < ApplicationController
  def index
    @countries_collection = CS.countries.map { |c| [I18n.transliterate(c[1]), c[0]] }
    @countries_collection.delete(["country_name", :COUNTRY_ISO_CODE])
    @countries_collection = @countries_collection.sort_by {|c| c[0]}

    @states_collection = []

    @can_submit = false
    render template: 'hospitals/index'
  end
end
