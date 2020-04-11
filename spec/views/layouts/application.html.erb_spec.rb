require "rails_helper"

RSpec.describe "laytous/application" do
  it "displayes internationalized text nodes" do
    render html: "<p>foo<p>", layout: "layouts/application"

    expect(rendered).to match t("layouts.application.brand")
    expect(rendered).to match t("layouts.application.hospitals_nav_link")
    expect(rendered).to match t("layouts.application.partners_nav_link")
    expect(rendered).to match t("layouts.application.faq_nav_link")
    expect(rendered).to match t("layouts.application.ngo_message")
    expect(rendered).to match t("layouts.application.about_footer_link")
    expect(rendered).to match t("layouts.application.tos_link")
    expect(rendered).to match t("layouts.application.privacy_link")
  end
end
