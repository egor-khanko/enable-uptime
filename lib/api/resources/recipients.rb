# frozen_string_literal: true

class API::Resources::Recipients < Grape::API
  helpers do
    def present_recipient(recipient)
      RecipientPresenter.new(recipient).present
    end

    def find_recipient(recipient_id)
      Recipient.find(recipient_id)
    rescue ActiveRecord::RecordNotFound => e
        error!({ error: e.message }, 404)
    end
  end
  namespace :recipients do
    get do
      Recipient.all.map do |recipient|
        present_recipient(recipient)
      end
    end

    get ':recipient_id' do
      present_recipient(find_recipient(params[:recipient_id]))
    end

    params do
      with(documentation: { param_type: 'body' }) do
        requires :email, type: String, desc: 'Email of the recipient'
        optional :monitored_service_ids, type: Array[Integer], desc: 'Ids of services to be monitored for this recipient'
      end
    end
    post do
      Recipient.create(params.slice(:email, :monitored_service_ids)).then do |recipient|
        present_recipient(recipient)
      end
    end

    params do
      with(documentation: { param_type: 'body' }) do
        optional :email, type: String, desc: 'Email of the recipient'
        optional :monitored_service_ids, type: Array[Integer], desc: 'Ids of services to be monitored for this recipient'
      end
    end
    put ':recipient_id' do
      find_recipient(params[:recipient_id]).then do |recipient|
        recipient.update(params.slice(:email, :monitored_service_ids))
      end
    end

    delete ':recipient_id' do
      present_recipient(find_recipient(params[:recipient_id]).delete)
    end
  end
end
