QPay::Rails::Engine.routes.draw do
  get "webhooks", to: "webhooks#show"
end
