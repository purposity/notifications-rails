# frozen_string_literal: true

require 'active_support'

module NotificationSettings
  module Settings
    extend ActiveSupport::Concern

    included do
      jsonb_accessor :settings
    end
  end
end
