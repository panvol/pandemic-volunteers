class CountriesController < ApplicationController
  def show
    country = ISO3166::Country.find_country_by_alpha2(country_params[:country])
    if country
      render partial: "country_code", locals: {
        country_code: country.country_code,
      }
    end
  end

  def country_params
    params.require(:volunteer).permit(:country)
  end
end
