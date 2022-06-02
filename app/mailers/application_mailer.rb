# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'monitoring@enable-uptime.com'
  layout 'mailer'
end
