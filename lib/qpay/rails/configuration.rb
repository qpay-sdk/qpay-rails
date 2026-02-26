module QPay
  module Rails
    class Configuration
      attr_accessor :base_url, :username, :password, :invoice_code, :callback_url

      def initialize
        @base_url = ENV.fetch("QPAY_BASE_URL", "https://merchant.qpay.mn")
        @username = ENV["QPAY_USERNAME"]
        @password = ENV["QPAY_PASSWORD"]
        @invoice_code = ENV["QPAY_INVOICE_CODE"]
        @callback_url = ENV["QPAY_CALLBACK_URL"]
      end
    end
  end
end
