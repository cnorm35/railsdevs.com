module Webhooks
  class StripeController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      payload = request.body.read
      event = nil

      begin
        event = Stripe::Event.construct_from(
          JSON.parse(payload, symbolize_names: true)
        )
      rescue JSON::ParserError => e
        # Invalid payload
        puts "⚠️  Webhook error while parsing basic request. #{e.message})"
        render json: { message: 'failed' }, status: 400
        return
      end

      case event.type
      when 'account.updated'
        account = event.data.object # contains a Stripe::Account
        # TODO: Handle account updates
      else
        puts "Unhandled event type: #{event.type}"
      end

      render json: { message: 'success' }
    end
  end
end
