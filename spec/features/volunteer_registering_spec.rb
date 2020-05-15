require "rails_helper"

RSpec.describe "A volunteer fills out registration form", js: true do
  scenario "their phone number if prefixed with country code" do
    pending "fix node sass error in test"
    visit "/"
    expect(page).to have_content(I18n.t("home.index.section-titles.form"))
    expect do
      select "Romania", from: "volunteer[country]"
    end.
      to change { find_field("volunteer[phone]").value }.
      from("").
      to("+40")
  end
end
