class HomeController < ApplicationController
  def index
    @form_object = ContactDetail.new
  end
end
