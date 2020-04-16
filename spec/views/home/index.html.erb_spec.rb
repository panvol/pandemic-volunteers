require "rails_helper"

RSpec.describe "home/index" do
  it "displays internationalized text nodes" do
    assign(:volunteer, Volunteer.new)
    assign(:countries_collection, [["foo", :bar]])
    assign(:states_collection, [["foo", :bar]])
    assign(:cities_collection, [["foo", :bar]])

    render template: "home/index", layout: "layouts/application"

    expect(rendered).to match t("home.index.aid_crews_title")
    expect(rendered).to match t("home.index.aid_crews_description")

    expect(rendered).to match t("home.index.elderly_crews_title")
    expect(rendered).to match t("home.index.elderly_crews_description")

    expect(rendered).to match t("home.index.elderly_crews_title")
    expect(rendered).to match t("home.index.elderly_crews_description")

    expect(rendered).to match t("home.index.coordination_crews_title")
    expect(rendered).to match t("home.index.coordination_crews_description")

    expect(rendered).to match t("home.index.research_ambassadors_title")
    expect(rendered).to match t("home.index.research_ambassadors_description")

    expect(rendered).to match t("home.index.triage_crews_title")
    expect(rendered).to match t("home.index.triage_crews_description")

    expect(rendered).to match t("home.index.hospital_crews_title")
    expect(rendered).to match t("home.index.hospital_crews_description")
  end
end
