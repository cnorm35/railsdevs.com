class AddStripeCustomerIdToBusinesses < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :stripe_customer_id, :string
  end
end
