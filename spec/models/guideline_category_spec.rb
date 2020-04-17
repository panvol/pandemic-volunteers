require "rails_helper"

RSpec.describe GuidelineCategory do
  it "returns a slug" do
    dir_path = "/foo/bar/00-bar-baz"
    presenter = described_class.new(dir_path, metadata)
    expect(presenter.slug).to eq("bar-baz")
  end

  it "returns a position" do
    dir_path = "/foo/bar/00-bar-baz"
    presenter = described_class.new(dir_path, metadata)
    expect(presenter.position).to eq(0)
  end

  it "returns a title" do
    dir_path = "/foo/bar/00-bar-baz"

    metadata = double(
      "GuidelinesMetadataExtractor",
      title: "foo",
      description: "bar",
      svg_filename: "baz",
    )

    presenter = described_class.new(dir_path, metadata)
    expect(presenter.title).to eq("foo")
  end

  it "returns a description" do
    dir_path =
      "/pandemic-volunteers/lib/markdown/en/guidelines/00-elderly-crews"

    metadata = double(
      "GuidelinesMetadataExtractor",
      title: "foo",
      description: "bar",
      svg_filename: "baz",
    )

    presenter = described_class.new(dir_path, metadata)
    expect(presenter.description).to eq("bar")
  end

  it "returns an svg_filename" do
    dir_path = "/foo/bar/00-bar-baz"

    metadata = double(
      "GuidelinesMetadataExtractor",
      title: "foo",
      description: "bar",
      svg_filename: "baz",
    )

    presenter = described_class.new(dir_path, metadata)
    expect(presenter.svg_filename).to eq("baz")
  end

  it "returns articles" do
    pending "TODO: add articles"
    dir_path =
      "/pandemic-volunteers/lib/markdown/en/guidelines/00-elderly-crews"

    presenter = described_class.new(dir_path, metadata)
    expect(presenter.articles).not_to be_empty
  end

  private

  def metadata
    double(
      "GuidelinesMetadataExtractor",
      title: nil,
      description: nil,
      svg_filename: nil,
    )
  end
end
