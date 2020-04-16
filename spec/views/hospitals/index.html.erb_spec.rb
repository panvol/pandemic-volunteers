require "rails_helper"

RSpec.describe "hospitals/index" do
  it "displays internationalized text nodes" do
    assign(:countries_collection, [["foo", :bar]])
    assign(:states_collection, [["foo", :bar]])
    render

    expect(rendered).to match t("hospitals.index.header")
    expect(rendered).to match t("hospitals.index.subheader")
    expect(rendered).to match t("hospitals.index.form.header")
    expect(rendered).to match t("hospitals.index.form.defaults.country")
    expect(rendered).to match t("hospitals.index.form.defaults.hospital_name")
    expect(rendered).to match t("hospitals.index.form.defaults.contact_name")
    expect(rendered).to match t("hospitals.index.form.defaults.contact_email")
    expect(rendered).to match t("hospitals.index.form.cta")
  end
end
