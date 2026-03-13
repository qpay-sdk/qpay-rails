# QPay Rails

[![Gem](https://img.shields.io/gem/v/qpay-rails)](https://rubygems.org/gems/qpay-rails)
[![CI](https://github.com/qpay-sdk/qpay-rails/actions/workflows/ci.yml/badge.svg)](https://github.com/qpay-sdk/qpay-rails/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

QPay V2 payment integration for Rails.

## Install

```ruby
gem "qpay-rails"
```

```bash
rails generate qpay:install
```

## Usage

```ruby
client = QPay::Rails.client
invoice = client.create_simple_invoice(
  invoice_code: "YOUR_CODE",
  sender_invoice_no: "ORDER-001",
  amount: 10000,
  callback_url: "https://yoursite.com/qpay/webhooks"
)
```

## View Helpers

```erb
<%= qpay_qr_code(invoice.qr_image) %>
<%= qpay_payment_links(invoice.urls) %>
```

## Webhook

QPay sends a `GET` request with `?qpay_payment_id=...` when payment is completed. The engine handles verification automatically.

Subscribe to payment events:

```ruby
ActiveSupport::Notifications.subscribe("payment_received.qpay") do |_name, _start, _finish, _id, payload|
  payment_id = payload[:payment_id]
  result = payload[:result] # QPay::PaymentDetail
  # handle payment
end
```

## License

MIT
