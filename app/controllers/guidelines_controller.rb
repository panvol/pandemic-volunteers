class GuidelinesController < ApplicationController
  def index
    @guidelines = guidelines
    @categories = category_guidelines
    @article = category_article

  end

  private

  def rows
    @rows ||= GuidelinesHelper.formatted_entries
  end

  def helper
    @helper ||= GuidelinesHelper.build_tree_from_options(rows)
  end

  def guidelines
    @guidelines ||= helper[locale.to_s]["guidelines"]
  end

  def category_guidelines
    @category_guidelines ||= guidelines.values.detect do |v|
      v.is_a?(Hash) && v[:slug] == category_slug
    end
  end

  def category_article
    @category_article ||= category_guidelines&.values&.detect do |v|
      v.is_a?(Hash) && v[:slug] == article_slug
    end
  end

  def category_slug
    guidelines_params.dig(:category_slug)
  end

  def article_slug
    guidelines_params.dig(:article_slug)
  end

  def guidelines_params
    params.permit(:category_slug, :article_slug, :locale)
  end
end
