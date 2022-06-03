# frozen_string_literal: true

class API::Resources::MonitoredServices < Grape::API
  helpers do
    def present_monitored_service(monitored_service)
      MonitoredServicePresenter.new(monitored_service).present
    end

    def find_monitored_service(monitored_service_id)
      MonitoredService.find(monitored_service_id)
    rescue ActiveRecord::RecordNotFound => e
        error!({ error: e.message }, 404)
    end
  end

  namespace :monitored_services do
    get do
      MonitoredService.all.map do |monitored_service|
        present_monitored_service(monitored_service)
      end
    end

    namespace ':monitored_service_id' do
      get do
        find_monitored_service(params[:monitored_service_id]).then do |monitored_service|
          present_monitored_service(monitored_service)
        end
      end

      get :last_check_result do
        find_monitored_service(params[:monitored_service_id]).then do |monitored_service|
          monitored_service.check_results.last.avaliable
        end
      end
    end

    params do
      with(documentation: { param_type: 'body' }) do
        requires :url, type: String, desc: 'Url for monitored service'
        requires :schedule, type: String, desc: 'Monitoring schedule in cron format'
      end
    end
    post do
      MonitoredService.create(params.slice(:url, :schedule)).then do |monitored_service|
        present_monitored_service(monitored_service)
      end
    end

    params do
      with(documentation: { param_type: 'body' }) do
        optional :url, type: String, desc: 'Url for monitored service'
        optional :schedule, type: String, desc: 'Monitoring schedule in cron format'
      end
    end
    put ':monitored_service_id' do
      monitored_service = find_monitored_service(params[:monitored_service_id])

      monitored_service.update(params.slice(:url, :schedule))
      present_monitored_service(monitored_service)
    end

    delete ':monitored_service_id' do
      find_monitored_service(params[:monitored_service_id]).delete.then do |deleted_monitored_service|
        present_monitored_service(deleted_monitored_service)
      end
    end
  end
end
