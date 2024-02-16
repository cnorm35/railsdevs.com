module Developers
  class Service < ApplicationRecord
    TYPES = %i[service_type rate active].freeze

    belongs_to :developer

    enum service_type: {
      hourly: 0,
      day: 1,
      retainer: 2
    }

    validates :service_type, :rate, :active, presence: true
  end
end
