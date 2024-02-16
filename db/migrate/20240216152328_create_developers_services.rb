class CreateDevelopersServices < ActiveRecord::Migration[7.0]
  def change
    create_table :developers_services do |t|
      t.belongs_to :developer, null: false, foreign_key: true
      t.integer :service_type, null: false
      t.integer :rate, null: false, default: 0
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
