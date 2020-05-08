require "rails_helper"

RSpec.describe "A user" do
  scenario "views a guideline article" do
    visit "/guidelines"

    expect(breadcrumbs).to eq(guidelines[:title])
    expect(header).to eq(guidelines[:title])
    expect(page).to have_content(guidelines[:description])

    expect(page).to have_content(category[:title])
    expect(page).to have_content(category[:description])

    click_on(category[:title])

    expect(breadcrumbs).to eq("#{guidelines[:title]} / #{category[:title]}")
    expect(header).to eq(category[:title])
    expect(page).to have_content(category[:description])

    expect(page).to have_content(article[:title])
    expect(page).to have_content(article[:description])

    click_on(article[:title])

    expect(page.html).to include(MarkdownHelper.to_html(article[:html]))
  end

  private

  def breadcrumbs
    find(".breadcrumbs").text
  end

  def header
    find(".section-title").text
  end

  def guidelines
    tree["en"]["guidelines"]
  end

  def category
    guidelines["00-elderly-crews"]
  end

  def article
    category["00-role-definition.md"]
  end

  def tree
    GuidelinesHelper.build_tree_from_nodes
  end
end
