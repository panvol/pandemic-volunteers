require "rails_helper"

RSpec.describe "volunteers/form" do
  it "displays internationalized text nodes" do
    assign(:countries, [["foo", :bar]])
    assign(:states_collection, [["foo", :bar]])
    assign(:cities_collection, [["foo", :bar]])

    render partial: "volunteers/form", locals: {
      volunteer: Volunteer.new,
      countries: [["foo", :bar]],
      states: [["foo", :bar]],
      cities: [["foo", :bar]],
      volunteer_crews: [["foo", :bar]],
    }

    expect(rendered).to match t("volunteers.form.errors.name")
    expect(rendered).to match t("volunteers.form.errors.email")
    expect(rendered).to match t("volunteers.form.errors.phone")
    expect(rendered).to match t("volunteers.form.errors.about")
    expect(rendered).to match t("volunteers.form.defaults.crew_collection")
    expect(rendered).to match t("volunteers.form.cta")
  end
end
