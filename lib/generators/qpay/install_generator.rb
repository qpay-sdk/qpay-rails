module Qpay
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)
    desc "Install QPay payment integration"

    def copy_initializer
      template "initializer.rb", "config/initializers/qpay.rb"
    end

    def add_route
      route 'mount QPay::Rails::Engine => "/qpay"'
    end

    def show_instructions
      say ""
      say "QPay installed! Set these environment variables:", :green
      say "  QPAY_BASE_URL=https://merchant.qpay.mn"
      say "  QPAY_USERNAME=your_username"
      say "  QPAY_PASSWORD=your_password"
      say "  QPAY_INVOICE_CODE=your_invoice_code"
      say "  QPAY_CALLBACK_URL=https://yoursite.com/qpay/webhooks"
    end
  end
end
