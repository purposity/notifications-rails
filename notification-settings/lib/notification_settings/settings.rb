# frozen_string_literal: true

require 'active_support'

module NotificationSettings
  module Settings
    extend ActiveSupport::Concern

    included do
      before_validation :build_settings

      jsonb_accessor :settings,
        category_settings: [:hash, default: {}, store_key: :categories_ ],
        delivery_method_settings: [:hash, default: {}, store_key: :delivery_methods_ ]

      include NotificationSettings::Settings::InstanceMethods
    end

    module InstanceMethods
      private

      def build_settings
        return if settings.present? && settings.is_a?(Hash)

        self.settings = Hash.new
      end
    end
  end
end
