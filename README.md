# QPay Rails

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

Subscribe to payment events:

```ruby
ActiveSupport::Notifications.subscribe("payment_received.qpay") do |_name, _start, _finish, _id, payload|
  invoice_id = payload[:invoice_id]
  # handle payment
end
```

## License

MIT
