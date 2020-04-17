require "rails_helper"

RSpec.describe "/guidelines", type: :request do
  let(:locale) { :en }
  it "returns a 200 " do
    get "/#{locale}/guidelines"

    expect(response.status).to eq(200)
  end

  it "returns page metadata" do
    locale = :en
    presenter = GuidelinesPresenter.new(locale)
    get "/#{locale}/guidelines"

    expect(response.body).to include presenter.title
    expect(response.body).to include presenter.description
  end

  it "returns a list of guidelines" do
    locale = :en
    categories = GuidelinesPresenter.new(locale).categories
    get "/#{locale}/guidelines"

    expect(response.body).to include categories.first.title
  end
end
