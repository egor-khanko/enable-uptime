# frozen_string_literal: true

class RecipientPresenter
  attr_reader :recipient

  def initialize(recipient)
    @recipient = recipient
  end

  def present
    {
      id: recipient.id,
      email: recipient.email,
      monitored_services_number: recipient.monitored_services.count
    }
  end
end
