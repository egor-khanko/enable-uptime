# frozen_string_literal: true

class NotifyRecipients < ApplicationJob
  queue_as :default

  def perform(check_result, recipients)
    recipients.each do |recipient|
      UserMailer.with(recipient: recipient, check_result: check_result).check_results.deliver_now
    end
  end
end
