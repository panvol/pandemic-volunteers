# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@pandemicvolunteers.org'
  layout 'mailer'
end
