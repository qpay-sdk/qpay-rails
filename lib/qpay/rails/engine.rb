module QPay
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace QPay::Rails

      initializer "qpay.helpers" do
        ActiveSupport.on_load(:action_view) do
          require "qpay_helper"
        end
      end
    end
  end
end
