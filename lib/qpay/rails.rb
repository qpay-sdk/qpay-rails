require "qpay"
require "qpay/rails/version"
require "qpay/rails/configuration"
require "qpay/rails/client"
require "qpay/rails/engine"

module QPay
  module Rails
    class << self
      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end

      def client
        Client.instance
      end
    end
  end
end
