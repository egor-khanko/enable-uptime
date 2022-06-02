# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def check_results
    @check_result = params[:check_result]

    mail to: params[:recipient].email
  end
end
