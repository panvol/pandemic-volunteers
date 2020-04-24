# require_relative "../../app/helpers/guidelines_helper"
require "rails_helper"

RSpec.describe GuidelinesHelper do
  it "builds a tree" do
    rows = described_class.formatted_entries
    result = described_class.build_tree_from_options(rows)
    expect(result).to be_a_kind_of(Hash)
  end
end
