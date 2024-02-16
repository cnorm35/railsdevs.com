class AddStripeAccountIdToDevelopers < ActiveRecord::Migration[7.0]
  def change
    add_column :developers, :stripe_account_id, :string
  end
end
