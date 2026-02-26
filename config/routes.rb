QPay::Rails::Engine.routes.draw do
  post "webhooks", to: "webhooks#create"
end
