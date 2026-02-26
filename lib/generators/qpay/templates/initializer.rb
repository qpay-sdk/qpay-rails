QPay::Rails.configure do |config|
  config.base_url     = ENV.fetch("QPAY_BASE_URL", "https://merchant.qpay.mn")
  config.username     = ENV.fetch("QPAY_USERNAME")
  config.password     = ENV.fetch("QPAY_PASSWORD")
  config.invoice_code = ENV.fetch("QPAY_INVOICE_CODE")
  config.callback_url = ENV.fetch("QPAY_CALLBACK_URL")
end
