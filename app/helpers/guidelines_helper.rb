require "pry"
module GuidelinesHelper
  # rubocop:disable Layout/LineLength
  DEFAULT_PATH = "/home/dimanyc/Desktop/ruby_sandbox/pandemic-volunteers/lib/markdown/".freeze
  # rubocop:enable Layout/LineLength
  DEFAULT_MARKDOWN_PATH = "lib/markdown/en".freeze
  METADATA_FILE_NAME = "metadata.yml".freeze

  def self.build_nodes
    Dir[Rails.root.join("lib/markdown/**/*")].map do |entry|
      full_path = entry.gsub(DEFAULT_PATH, "")

      metadata = parse_metadata(entry)
      id = entry.split("/").last

      # rubocop:disable Layout/LineLength
      {
        id: id,
        full_path: full_path,
        title: metadata&.dig("title") || generate_title(entry),
        description: metadata&.dig("description") || generate_description(entry),
        svg_filename: metadata&.dig("svg_filename"),
        position: generate_position(entry),
        slug: generate_slug(entry, metadata),
        is_metadata: id == METADATA_FILE_NAME,
        md_path: File.open(Rails.root.join("lib/markdown", full_path)),
      }
      # rubocop:enable Layout/LineLength
    end
  end

  def self.generate_slug(entry, metadata)
    title = metadata&.dig("title") || generate_title(entry)
    title.parameterize
  end

  def self.generate_position(entry)
    if entry.split("/").last.start_with?(/\d/)
      entry.split("-").first.to_i
    end
  end

  def self.parse_metadata(entry)
    metadata_path = File.join(entry, METADATA_FILE_NAME)
    if File.exist?(metadata_path)
      YAML::load_file(metadata_path)
    end
  end

  def self.generate_title(entry)
    title = entry.split("/").last.humanize
    if entry.split(".").last == "md"
      File.read(entry).each_line do |line|
        if line.start_with?("# ")
          title = line.
            gsub("# ", "").
            gsub("\n", "")
        end
      end
    end
    title
  end

  def self.generate_description(entry)
    description = nil
    if entry.split(".").last == "md"
      File.read(entry).each_line do |line|
        if line.start_with?("######")
          description = line.
            gsub("###### ", "").
            gsub("\n", "")
        end
      end
    end
    description
  end

  def self.build_tree_from_nodes(nodes = build_nodes)
    key_groups = nodes.map do |opt_group|
      {
        node: opt_group,
        path: opt_group[:full_path].split("/"),
      }
    end

    build_tree(key_groups)
  end

  def self.build_tree(rows)
    root = {}

    rows.each do |row|
      key_paths = row[:path]
      node = row[:node]
      build_branch(key_paths, root, node)
    end

    root
  end

  def self.build_branch(key_paths, root, leaf = {})
    last_child = key_paths.reduce(root) do |node, key|
      child = node[key] || {}
      node[key] = child

      child
    end
    last_child.merge!(leaf)
  end
end
