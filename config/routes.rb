Rails.application.routes.draw do
  get "/tweets", to: "tweets#index"
  post "/tweets", to: "tweets#create"
  get "/tweet/:id", to: "tweets#show"
  delete "/tweet/:id", to: "tweets#destroy"
end
