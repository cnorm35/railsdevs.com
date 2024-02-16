module Stripe
  class AccountsController < ApplicationController
    before_action :authenticate_user!
    def show
    end

    def create
      account = Stripe::Account.create(
        type: 'standard',
        email: current_user.email,
        business_type: 'individual',
        business_profile: {
          mcc: '5818',
        },
        individual: {
          email: current_user.email,
        },
        metadata: {
          developer_id: current_user.id,
        },
      )
      current_user.developer.update(stripe_account_id: account.id)

      account_link = Stripe::AccountLink.create(
        account: account.id,
        refresh_url: stripe_account_url,
        return_url: stripe_account_url,
        type: 'account_onboarding',
      )

      redirect_to account_link.url, status: :see_other, allow_other_host: true
    end
  end
end
