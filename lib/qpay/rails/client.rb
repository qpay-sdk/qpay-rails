module QPay
  module Rails
    class Client
      class << self
        def instance
          @instance ||= build_client
        end

        def reset!
          @instance = nil
        end

        private

        def build_client
          cfg = QPay::Rails.configuration
          config = QPay::Config.new(
            base_url: cfg.base_url,
            username: cfg.username,
            password: cfg.password,
            invoice_code: cfg.invoice_code,
            callback_url: cfg.callback_url
          )
          QPay::Client.new(config: config)
        end
      end
    end
  end
end
