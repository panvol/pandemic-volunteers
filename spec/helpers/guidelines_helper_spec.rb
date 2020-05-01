# require_relative "../../app/helpers/guidelines_helper"
require "rails_helper"

RSpec.describe GuidelinesHelper do
  describe ".generate_slug" do
    it "generates an SEO-friendly slug based on path" do
      expect(described_class.generate_slug("Foo/Bar BAz", nil)).to eq("bar-baz")
    end
    context "when metadata is available" do
      it "generates an SEO-friendly slug based on metadata value" do
        metadata = {
          "title" => "Bar BAz",
        }
        expect(described_class.generate_slug("str", metadata)).to eq("bar-baz")
      end
    end
  end

  describe ".generate_position" do
    it "generates a position based on prepended digits in the file name" do
      expect(described_class.generate_position("00123-foo.xxx")).to eq(123)
    end

    context "when file name is not prepended with any digits" do
      it "returns nil" do
        expect(described_class.generate_position("foo.xxx")).to eq(nil)
      end
    end
  end

  describe ".generate_title" do
    it "generates human-friendly title" do
      expect(described_class.generate_title("foo/bar baz fIzz")).to eq(
        "Bar baz fizz",
      )
    end
    context "when entry is a markdown file" do
      it "uses header 1 as the title" do
        markdown = <<~MARKDOWN
          # Foo Bar
          ## Bar baz
          Lorem ipsum
        MARKDOWN

        # rubocop:disable Layout/LineLength
        entry_path = "spec/support/lib/markdown/en/guidelines/00-elderly-crews/00-role-definition.md"
        # rubocop:enable Layout/LineLength

        File.open(entry_path, "w+") do |file|
          file.write(markdown)
        end

        expect(described_class.generate_title(entry_path)).to eq("Foo Bar")
      end
    end
  end

  describe ".generate_description" do
    it "uses header 1 as the title" do
      markdown = <<~MARKDOWN
        # Foo Bar
        ## Bar baz
        ###### Lorem ipsum
      MARKDOWN

      # rubocop:disable Layout/LineLength
      entry_path = "spec/support/lib/markdown/en/guidelines/00-elderly-crews/00-role-definition.md"
      # rubocop:enable Layout/LineLength

      File.open(entry_path, "w+") do |file|
        file.write(markdown)
      end

      expect(described_class.generate_description(entry_path)).
        to eq("Lorem ipsum")
    end
  end

  describe ".build_nodes" do
    it "returns an array of nodes" do
      expect(described_class.build_nodes).to be_a_kind_of(Array)
    end
  end

  describe ".build_tree_from_nodes" do
    it "builds a DFS hash of nodes" do
      nodes = [
        { id: "a", full_path: "a" },
        { id: "b", full_path: "a/b" },
        { id: "c", full_path: "a/b/c" },
      ]
      expect(described_class.build_tree_from_nodes(nodes)).to eq(
        {
          "a" => {
            :id => "a", :full_path => "a", "b" => {
              :id => "b", :full_path => "a/b", "c" => {
                id: "c", full_path: "a/b/c"
              }
            }
          },
        },
      )
    end
  end
end
