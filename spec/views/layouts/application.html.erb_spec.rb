require "rails_helper"

RSpec.describe "laytous/application" do
  it "displayes internationalized text nodes" do
    render html: "<p>foo<p>", layout: "layouts/application"

    expect(rendered).to match t("layouts.application.brand")
    expect(rendered).to match t("layouts.application.hospitals_nav_link")
    expect(rendered).to match t("layouts.application.partners_nav_link")
    expect(rendered).to match t("layouts.application.faq_nav_link")
    # Footer is temporarily looking for contributors
    # expect(rendered).to match t("layouts.application.footer.text")
    expect(rendered).to match t("common.about")
    expect(rendered).to match t("common.terms")
    expect(rendered).to match t("common.privacy")
  end
end
