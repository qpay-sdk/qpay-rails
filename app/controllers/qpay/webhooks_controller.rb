module QPay
  class WebhooksController < ActionController::API
    def create
      invoice_id = params[:invoice_id]

      unless invoice_id.present?
        render json: { error: "Missing invoice_id" }, status: :bad_request
        return
      end

      begin
        client = QPay::Rails.client
        result = client.check_payment(
          object_type: "INVOICE",
          object_id: invoice_id
        )

        if result.rows&.any?
          ActiveSupport::Notifications.instrument("payment_received.qpay", {
            invoice_id: invoice_id,
            result: result
          })
          render json: { status: "paid" }
        else
          render json: { status: "unpaid" }
        end
      rescue StandardError => e
        render json: { error: e.message }, status: :internal_server_error
      end
    end
  end
end
