module QPay
  class WebhooksController < ActionController::API
    def show
      payment_id = params[:qpay_payment_id]

      unless payment_id.present?
        render plain: "ERROR", status: :bad_request
        return
      end

      begin
        client = QPay::Rails.client
        result = client.get_payment(payment_id)

        if result&.payment_status == "PAID"
          ActiveSupport::Notifications.instrument("payment_received.qpay", {
            payment_id: payment_id,
            result: result
          })
        end

        render plain: "SUCCESS", status: :ok
      rescue StandardError => e
        ::Rails.logger.error("[QPay] Callback verification failed: #{e.message}")
        render plain: "SUCCESS", status: :ok
      end
    end
  end
end
