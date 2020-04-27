# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'partners/index' do
  it 'displays internationalized text nodes' do
    assign(:countries_collection, [['foo', :bar]])
    assign(:states_collection, [['foo', :bar]])

    render template: 'partners/index', locals: {
      partner: Partner.new,
      partner_staff: PartnerStaff.new
    }

    expect(rendered).to match t('partners.index.form.header')
    expect(rendered).to match t('partners.index.form.defaults.country')
    expect(rendered).to match t('partners.index.form.errors.organization_name')
    expect(rendered).to match t('partners.index.form.errors.organization_about')
    expect(rendered).to match t('partners.index.form.errors.organization_about')
    expect(rendered).to match t('partners.index.form.errors.organization_type')
    expect(rendered).to match t('partners.index.form.errors.staff_name')
    expect(rendered).to match t('partners.index.form.errors.staff_email')
    expect(rendered).to match t('partners.index.form.errors.staff_role')
    expect(rendered).to match t('partners.index.form.cta')
  end
end
