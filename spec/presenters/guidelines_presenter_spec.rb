require "rails_helper"

RSpec.describe GuidelinesPresenter do
  it "returns a list of guidelines based on locale" do
    expect(presenter.categories).not_to be_empty
  end

  it "returns a list of guidelines with slugs" do
    expect(presenter.categories.first.slug).not_to be_empty
  end

  it "parses metadata" do
    allow(GuidelineCategory).to receive(:new)
    presenter.categories
    expect(GuidelineCategory).to have_received(:new).with(
      instance_of(String),
      instance_of(Hash),
    )
  end

  it "returns a title" do
    expect(presenter.title).not_to be_empty
  end

  it "returns a description" do
    expect(presenter.description).not_to be_empty
  end

  private

  def presenter
    described_class.new(:en)
  end
end
